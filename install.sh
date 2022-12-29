#!/usr/bin/env bash

exists-cmd() {
  command -v $1 >/dev/null 2>&1
}

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
  pip3 install pynvim
else
  echo 'You need to manually install the pynvim'
fi
