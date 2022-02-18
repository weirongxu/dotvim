let $MY_VIMFILES = escape(expand('<sfile>:p:h'), '\')
let $MY_VIMRC = $MY_VIMFILES . '/vimrc'
let $MY_BUILDIN = $MY_VIMFILES . '/buildin'
let $MY_PLUGINS = $MY_VIMFILES . '/plugins/index.vim'

if &compatible
  set nocompatible
endif

source $MY_VIMFILES/buildin/boot.vim
Include highlights.vim
Include mappings.vim
Include plugins.vim
Include options.vim
Include tabline.vim

syntax on
filetype plugin indent on
