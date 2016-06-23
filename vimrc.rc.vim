let $MY_VIMFILES = expand('<sfile>:p:h')
let $MY_PLUGINS = $MY_VIMFILES . '/dein.rc.yml'
let $DEIN_DIR = $MY_VIMFILES . '/dein'

if &compatible
  set nocompatible
endif

source $MY_VIMFILES/boot/boot.rc.vim
Inc maps
Inc plugins
Inc options

syntax on
filetype plugin indent on
