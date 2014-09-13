" env
let g:env#win = has('win32') || has('win64') || has('win95')
let g:env#unix = has('unix')
let g:env#mac = has('mac') || has('macunix')

let g:env#gui = has('gui_running')
let g:env#xterm = &term == 'xterm'
let g:env#x = g:env#gui || g:env#xterm

let g:env#python2 = has('python')
let g:env#python3 = has('python3')
let g:env#python = g:env#python2 || g:env#python3
let g:env#lua = has('lua')
let g:env#ruby = has('ruby')
let g:env#perl = has('perl')
let g:env#tcl = has('tcl')

let g:env#tmp = g:env#win ? $TMP : expand("~/tmp")
if !isdirectory(g:env#tmp)
  call mkdir(g:env#tmp)
endif

" Loading config
let $MYVIMFILES = expand('~/.vim')
let $MYPlugin = $MYVIMFILES . '/plugins.vim'
let $MYBUNDLEDIR = $MYVIMFILES . '/bundle'
execute 'command -nargs=1 Include source '.$MYVIMFILES.'/<args>.vim'
Include options
Include mapkeys
Include plugins

" Syntax
au BufRead,BufNewFile *.js set syntax=jquery
au BufRead,BufNewFile *.css set syntax=css3
au FileType c,cpp set syntax=gtk

syntax on
syntax enable
" Check file type
filetype on
filetype plugin on
filetype plugin indent on
