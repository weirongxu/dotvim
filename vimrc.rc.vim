let $MYVIMFILES = expand('<sfile>:p:h')
let $MY_PLUGINS = $MYVIMFILES . '/dein.rc.yml'
let $DEIN_DIR = $MYVIMFILES . '/dein'

if &compatible
  set nocompatible
endif

source $MYVIMFILES/boot/boot.rc.vim
Inc maps
Inc plugins
Inc options

syntax on
filetype plugin indent on
