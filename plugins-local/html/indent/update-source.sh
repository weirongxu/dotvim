#!/usr/bin/env bash
curl -L https://raw.githubusercontent.com/vim/vim/master/runtime/indent/html.vim -o source-html.vim
echo "run patch source-html.vim html.patch -o html.vim"
