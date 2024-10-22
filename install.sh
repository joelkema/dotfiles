#!/usr/bin/env bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew bundle 
brew tap Homebrew/bundle

# Install Brewfile
brew bundle install

# Set up symlinks using stow
source symlinks.sh

# Update settings
source ~/.zshrc
