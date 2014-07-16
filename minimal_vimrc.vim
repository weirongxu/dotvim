" env
let g:env#win = has('win32') || has('win64') || has('win95')
let g:env#unix = has('unix')

if g:env#unix
  let $MYVIMFILES = '~/.vim'
elseif g:env#win
  let $MYVIMFILES = $VIM.'/vimfiles'
endif
let $MYBUNDLEDIR = $MYVIMFILES . '/bundle'

" options
set nocompatible
set wildmenu
if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYVIMFILES.'/bundle/neobundle.vim'
endif
call neobundle#rc(expand($MYBUNDLEDIR))

" plugin
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimfiler.vim'

" syntax
syntax on
syntax enable
filetype on
filetype plugin on
filetype plugin indent on
