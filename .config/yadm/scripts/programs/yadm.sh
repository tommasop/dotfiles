#!/bin/bash

echo "Installing YADM"
if ! command -v yadm &>/dev/null; then
    curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && chmod a+x /usr/local/bin/yadm
    yadm clone https://github.com/tommasop/dotfiles
    yadm status
else
  echo "You already have yadm installed!"
fi
