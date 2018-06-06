let $MY_VIMFILES = expand('<sfile>:p:h')
let $MY_VIMRC = $MY_VIMFILES . '/vimrc.rc.vim'
let $MY_PLUGINS = $MY_VIMFILES . '/plugins.rc.yml'

if &compatible
  set nocompatible
endif

source $MY_VIMFILES/boot/boot.rc.vim
Include package-installer
Include maps
Include lsp
Include plugins-boot
Include options

syntax on
filetype plugin indent on
