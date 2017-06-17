#!/usr/bin/env bash

# install dein.vim
curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh | bash -s ./dein

# install pip3
if hash apt-get 2>/dev/null; then
  sudo apt-get install python3-pip
elif hash brew 2>/dev/null; then
  brew install python3
fi

# install python yaml and neovim
pip3 install pyyaml
pip3 install neovim
