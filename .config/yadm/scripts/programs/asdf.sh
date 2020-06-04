#!/bin/bash

echo "Installing ASDF"
if ! command -v asdf &>/dev/null; then
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
  echo "You already have asdf installed!"
fi
