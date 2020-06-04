#!/bin/bash

echo "Installing ASDF"
if ! command -v asdf &>/dev/null; then
  pretty_print "Installing asdf ..."
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf
    cd ~/.asdf
    git checkout "$(git describe --abbrev=0 --tags)"
    
    cd ~
    asdf update
    asdf plugin add ruby
    asdf plugin add nodejs
    bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
    asdf plugin add elixir
    asdf plugin add postgres
else
  pretty_print "You already have asdf installed!"
fi
