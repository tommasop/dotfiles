#!/usr/bin/env bash

pretty_print() {
  printf "\n%b\n" "$1"
}
# 
pretty_print "Here we go..."

# So it begins

# Asdf installation

if ! command -v asdf &>/dev/null; then
  pretty_print "Installing asdf ..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    
    cd ~
    asdf update
    asdf plugin add ruby
    asdf plugin add nodejs
    asdf plugin add elixir
    asdf plugin add postgres
else
  pretty_print "You already have asdf installed!"
fi
