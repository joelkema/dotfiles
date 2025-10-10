#!/usr/bin/env bash
set -euo pipefail

TARGET="${HOME}"

# Detect if this stow supports --adopt
STOW_ADOPT=""
if stow --help 2>&1 | grep -q -- '--adopt'; then
  STOW_ADOPT="--adopt"
fi

# Preview mode: ./symlinks.sh --dry-run
if [[ "${1:-}" == "--dry-run" ]]; then
  for d in */ ; do
    pkg="${d%/}"
    stow -nvt "$TARGET" "$pkg" || true
  done
  exit 0
fi

# Prefer to adopt zsh first so ~/.zshrc lands in the zsh package
if [[ -d zsh ]]; then
  stow --restow $STOW_ADOPT -vt "$TARGET" zsh
fi

# Then do the rest
for d in */ ; do
  pkg="${d%/}"
  [[ "$pkg" == "zsh" ]] && continue
  # Skip repo directories you don't want stowed
  case "$pkg" in
    .git|scripts|bin|ansible) continue ;;
  esac
  stow --restow $STOW_ADOPT -vt "$TARGET" "$pkg"
done
