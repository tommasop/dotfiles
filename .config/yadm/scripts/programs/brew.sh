#!/bin/bash
echo "Installing Homebrew"

if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew package manager, follow the instructions..." 
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

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
    # ack
    # ffmpeg
    # graphviz
    # imagemagick
    # jq
    # libjpeg
    # tmux
    # nvim
    youtube-dl
    # ag
    # cmake
    # redis
    pgcli
    ripgrep
    cloc
)

echo "Installing packages..."
brew install ${PACKAGES[@]}

echo "Cleaning up..."
brew cleanup
