#!/usr/bin/env bash
# Re-exec with bash if not already running under bash
if [ -z "${BASH_VERSION:-}" ]; then exec /usr/bin/env bash "$0" "$@"; fi

set -Eeuo pipefail
(set -o pipefail) 2>/dev/null || true

# -------------------- flags --------------------
DRY_RUN=false
for arg in "$@"; do
  case "$arg" in
    -n|--dry-run) DRY_RUN=true ;;
  esac
done

# -------------------- helpers --------------------
has()        { command -v "$1" >/dev/null 2>&1; }
is_macos()   { [ "$(uname -s)" = "Darwin" ]; }
is_linux()   { [ "$(uname -s)" = "Linux" ]; }
is_wsl()     { is_linux && grep -qiE 'microsoft|wsl' /proc/version 2>/dev/null; }
is_alpine()  { is_linux && [ -f /etc/alpine-release ]; }
is_ubuntu()  { is_linux && [ -r /etc/os-release ] && . /etc/os-release && [ "${ID:-}" = "ubuntu" ]; }

BLUE='\033[1;34m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; RESET='\033[0m'
step_n=0; steps_total=8
step() { step_n=$((step_n+1)); printf "${BLUE}[ %d/%d ]${RESET} %s\n" "$step_n" "$steps_total" "$1"; }
ok()   { printf "${GREEN}[ ok ]${RESET} %s\n" "$1"; }
warn() { printf "${YELLOW}[ !! ]${RESET} %s\n" "$1"; }

run() {
  if $DRY_RUN; then
    echo "  [dry-run] $*"
  else
    eval "$@"
  fi
}

# -------------------- steps --------------------
ensure_brew_macos() {
  step "Ensuring Homebrew (macOS)"
  if ! has brew; then
    run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
    run 'eval "$(/opt/homebrew/bin/brew shellenv 2>/dev/null || /usr/local/bin/brew shellenv)"'
    ok "Homebrew installed"
  else
    run 'eval "$(brew shellenv)"'
    ok "Homebrew already present"
  fi
}

apply_brewfile_macos() {
  step "Applying Brewfile (macOS)"
  if [[ -f Brewfile ]]; then
    run "brew tap Homebrew/bundle || true"
    run "brew bundle install"
    ok "Brewfile installed"
  else
    warn "No Brewfile found; skipping brew bundle"
  fi
}


ensure_stow_any() {
  step "Ensuring GNU stow is installed"
  if has stow; then
    ok "stow already present"
    return
  fi

  if is_macos; then
    ensure_brew_macos
    run "brew install stow"
    ok "Installed stow via Homebrew"
  elif is_alpine; then
    run "sudo apk update"
    run "sudo apk add stow"
    ok "Installed stow via apk"
  elif is_linux && has apt-get; then
    run "sudo apt-get update -y"
    run "sudo apt-get install -y stow"
    ok "Installed stow via apt"
  elif is_linux && (has dnf || has yum); then
    run 'if has dnf; then sudo dnf install -y stow; else sudo yum install -y stow; fi'
    ok "Installed stow via dnf/yum"
  else
    warn "Unknown package manager; please install 'stow' manually and re-run"
  fi
}

ensure_base_linux_wsl() {
  step "Ensuring base packages on Linux/WSL"
  # Keep it minimal—just what we rely on here
  local pkgs="zsh git curl"
  if is_alpine; then
    sudo apk update
    sudo apk add $pkgs
    ok "Base packages installed via apk"
  elif has apt-get; then
    sudo apt-get update -y
    sudo apt-get install -y $pkgs
    ok "Base packages installed via apt"
  elif has dnf || has yum; then
    if has dnf; then sudo dnf install -y $pkgs; else sudo yum install -y $pkgs; fi
    ok "Base packages installed via dnf/yum"
  else
    warn "Could not detect a supported package manager for base packages"
  fi
}

configure_git_identity() {
  step "Configuring git identity (if missing)"
  local name email
  name="$(git config --global user.name || true)"
  email="$(git config --global user.email || true)"
  if [[ -z "$name" ]]; then
    run 'git config --global user.name "Joel Kema"'
    ok "Set git user.name"
  else
    ok "git user.name already set to: $name"
  fi
  if [[ -z "$email" ]]; then
    run 'git config --global user.email "joelkema1988@gmail.com"'
    ok "Set git user.email"
  else
    ok "git user.email already set to: $email"
  fi

  if is_wsl; then
    run "git config --global core.autocrlf input || true"
    ok "Configured git line endings for WSL"
  fi
}

install_oh_my_zsh() {
  step "Installing Oh My Zsh (if missing)"
  if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
    RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    ok "Oh My Zsh installed"
  else
    ok "Oh My Zsh already installed"
  fi
}

apply_symlinks_with_stow() {
  step "Applying symlinks with stow"
  if ! has stow; then
    warn "stow not found; skipping symlinks (run ensure_stow_any first)"
    return
  fi
  if [[ -f ./symlinks.sh ]]; then
    # shellcheck source=/dev/null
    run 'source ./symlinks.sh'
    ok "Symlinks applied"
  else
    warn "symlinks.sh not found; skipping"
  fi
}

ensure_default_shell_zsh() {
  step "Setting zsh as default shell (if not already)"
  if [[ "${SHELL:-}" != *"/zsh" ]] && has zsh; then
    if has chsh; then
      chsh -s "$(command -v zsh)" && ok "Default shell set to zsh" || warn "chsh failed; set default shell manually"
    else
      warn "chsh not available; skipping default shell change"
    fi
  else
    ok "zsh already default or zsh not installed"
  fi
}

reload_zshrc() {
  step "Reloading ~/.zshrc (if present)"
  if [[ -f "$HOME/.zshrc" ]]; then
    run 'zsh -ic "source ~/.zshrc" || true'
    if ! $DRY_RUN; then
      ok "Reloaded ~/.zshrc"
    else
      ok "Would reload ~/.zshrc (dry-run)"
    fi
  else
    warn "~/.zshrc not found; skipping"
  fi
}

# -------------------- main (order of steps) --------------------
main() {
  if $DRY_RUN; then
    printf "${YELLOW}*** Running in DRY-RUN mode — no changes will be made ***${RESET}\n\n"
  fi

  step "Detecting OS"
  if is_macos; then
    ok "Detected macOS"
    ensure_brew_macos
    apply_brewfile_macos
  elif is_wsl; then
    ok "Detected WSL (Windows Subsystem for Linux)"
    ensure_base_linux_wsl
  elif is_linux; then
    ok "Detected Linux"
  else
    warn "Unknown OS: $(uname -s)"
  fi

  ensure_stow_any
  configure_git_identity
  install_oh_my_zsh
  apply_symlinks_with_stow
  ensure_default_shell_zsh
  reload_zshrc

  ok "install.sh finished"
}

main "$@"
