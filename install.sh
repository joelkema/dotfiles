#!/usr/bin/env bash

# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew bundle 
brew tap Homebrew/bundle

# Install Brewfile
brew bundle install

# Install Homebrew formulae
source brew.sh

# Install node packages
source node.sh

# Set up symlinks using stow
source symlinks.sh

# Update settings
source ~/.zshrc
