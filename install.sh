#!/usr/bin/env bash

exists-cmd() {
  command -v $1 >/dev/null 2>&1
}

# install pip3
if exists-cmd apt-get; then
  if ! exists-cmd pip3; then
    sudo apt-get install python3-pip
  fi
elif exists-cmd brew; then
  if ! exists-cmd pip3; then
    brew install python3
  fi
fi

if exists-cmd pip3; then
  # install python yaml and neovim
  pip3 install pyyaml
  pip3 install neovim
else
  echo 'manual install pyyaml and neovim please'
fi

./install-dein.sh
