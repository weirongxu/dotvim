let $MY_VIMFILES = expand('<sfile>:p:h')
let $MY_PLUGINS = $MY_VIMFILES . '/plugins.rc.yml'

if &compatible
  set nocompatible
endif

source $MY_VIMFILES/boot/boot.rc.vim
Inc maps
Inc plugins-boot
Inc options

syntax on
filetype plugin indent on
