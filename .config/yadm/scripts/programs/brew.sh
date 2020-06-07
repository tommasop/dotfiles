#!/bin/bash
echo "Installing Homebrew"

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew package manager, follow the instructions..." 
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
    echo "Put Homebrew location earlier in PATH ..."
      echo '\n# recommended by brew doctor\n' >> ~/.zshrc
      echo 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
      export PATH="/usr/local/bin:$PATH"
  fi
else
  echo "You already have Homebrew installed...good job!"
fi

echo "Updating brew formulas"
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
    youtube-dl
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup
