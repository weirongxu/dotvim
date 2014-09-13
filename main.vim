" Loading config
execute 'command! -nargs=1 Include source '.$MYVIMFILES.'/<args>.vim'
Include options
Include mapkeys
let $MYPlugin = $MYVIMFILES . '/plugins.vim'
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
