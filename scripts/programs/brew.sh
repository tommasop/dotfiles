#!/usr/bin/env bash

# This is part of a larger script for setting a mac for python development.
set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "Here we go..."

# Homebrew installation

if ! command -v brew &>/dev/null; then
  pretty_print "Installing Homebrew package manager, follow the instructions..." 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    pretty_print "Put Homebrew location earlier in PATH ..."
      printf '\n# recommended by brew doctor\n' >> ~/.zshrc
      printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  pretty_print "You already have Homebrew installed...good job!"
fi

# Homebrew OSX libraries

pretty_print "Updating brew formulas"
  	brew update

PACKAGES=(
    ack
    ffmpeg
    graphviz
    imagemagick
    jq
    libjpeg
    python
    python3
    the_silver_searcher
    tmux
    nvim
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup

printf 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
