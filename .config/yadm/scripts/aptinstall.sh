#!/bin/bash

sudo add-apt-repository ppa:ubuntu-ppa/backports
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update && sudo apt full-upgrade -y

function install {
  which $1 &> /dev/null

  if [ $? -ne 0 ]; then
    echo "Installing: ${1}..."
    sudo apt install -y $1
  else
    echo "Already installed: ${1}"
  fi
}

# Basics
install curl
install git
install nmap
install tree
install xclip
install zsh
install pass
install neovim
install tmux
install cmus
