#!/usr/bin/env bash
# Shared OS-detection and logging helpers, sourced by install.sh.

has()        { command -v "$1" >/dev/null 2>&1; }
is_macos()   { [ "$(uname -s)" = "Darwin" ]; }
is_linux()   { [ "$(uname -s)" = "Linux" ]; }
is_wsl()     { is_linux && grep -qiE 'microsoft|wsl' /proc/version 2>/dev/null; }
is_alpine()  { is_linux && [ -f /etc/alpine-release ]; }
is_ubuntu()  { is_linux && [ -r /etc/os-release ] && . /etc/os-release && [ "${ID:-}" = "ubuntu" ]; }

BLUE='\033[1;34m'; GREEN='\033[1;32m'; YELLOW='\033[1;33m'; RESET='\033[0m'
step_n=0
step() { step_n=$((step_n+1)); printf "${BLUE}[ %d/%d ]${RESET} %s\n" "$step_n" "${steps_total:-?}" "$1"; }
ok()   { printf "${GREEN}[ ok ]${RESET} %s\n" "$1"; }
warn() { printf "${YELLOW}[ !! ]${RESET} %s\n" "$1"; }

run() {
  if ${DRY_RUN:-false}; then
    echo "  [dry-run] $*"
  else
    eval "$@"
  fi
}
