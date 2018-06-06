let $MY_VIMFILES = expand('<sfile>:p:h')
let $MY_VIMRC = $MY_VIMFILES . '/vimrc.rc.vim'
let $MY_BUILDIN = $MY_VIMFILES . '/buildin'
let $MY_PLUGINS = $MY_VIMFILES . '/plugins/index.rc.yml'

if &compatible
  set nocompatible
endif

source $MY_VIMFILES/buildin/boot.rc.vim
Include maps
Include plugins
Include options

syntax on
filetype plugin indent on
