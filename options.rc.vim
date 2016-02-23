" UI
if g:env#gui
  set guioptions=
  set showtabline=2

  " Menu
  command! Menu if &guioptions =~# 'm' |
        \set guioptions-=mr |
        \else |
        \set guioptions+=mr |
        \endif
endif

" encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,chinese,latin-1
set fileformats=unix,dos,mac

set fileencoding=utf-8 encoding=utf-8 termencoding=utf-8
set fileformat=unix

" Colorscheme
colo Tomorrow-Night-Eighties
" colo manuscript
" colo pyte
" colo molokai
" colo desertink
" colorscheme desert
set background=dark


" t_Co gui-font
if g:env#x
  set t_Co=256
endif
if g:env#unix
  " set guifont=Menlo\ 10,*
  set guifont=Monaco\ for\ Powerline\ 10
  " set guifont=Consolas\ 11
  " set guifont=Monofur\ For\ Powerline\ 10,*
  " set guifont=Source\ Code\ Pro\ 10,*
  " set guifont=SimSun\ for\ Powerline\ 10
  " set guifont=Courier\ New\ for\ Powerline\ 10
elseif g:env#win
  set guifont=Monaco:h10,Consolas:h11:cANSI,Courier_New_for_Powerline:h10:cANSI,*
  " set guifont=Source_Code_Pro:h9:cANSI
  " set guifont=monofur_for_Powerline:h10.5:w5,Courier_new:h10,*
endif

" set verbose=1

" compatible
set nocompatible " vi-compatible,
set mouse=a " support mouse

" edit show
set nobomb linespace=0 ambiwidth=double
set concealcursor=
set list listchars=tab:\|\ ,trail:.
" set cursorline cursorcolumn

" interface
set guitablabel=%t\ %M number showmatch scrolloff=5 ruler
" Don't redraw while executing macros (good performance config)
" set lazyredraw

" cmd
set wildmenu " command complete menu inline
" set cmdheight=2
set laststatus=2
set shortmess=aoOtT

" break multi-line
" set nowrap
" set linebreak
" set textwidth=500
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l

" complete
set completeopt=longest,menu

" pairs
set matchpairs+=（:）,《:》

" tab
set expandtab " tab use spaces
set shiftround
set tabstop=4 " Tab len
set softtabstop=4
set shiftwidth=4 " << >>
" autoindent
set nosmartindent autoindent smarttab nocindent

" search
set incsearch hlsearch ignorecase smartcase magic

" dir
set browsedir=buffer " file browse dir
set noautochdir " dont change dir when into a buffer
set wildignore=*.o,*~,*.pyc " ignore file

set autoread " auto read when file changed outside of Vim

" sound
set noerrorbells novisualbell t_vb= tm=500

" backup
let &backupdir = g:env#tmp
let &directory = g:env#tmp
set backup writebackup swapfile

" highlight 80 columns
function! s:set_colorcolumn() "{{{
  if &ft !~ '\v(^$|markdown|vimfiler|unite|tagbar)'
    set colorcolumn=81
  else
    set colorcolumn=
  endif
endfunction "}}}
autocmd FileType * call s:set_colorcolumn()

" fold
autocmd FileType coffee,jade,stylus,sass setl foldmethod=indent foldlevel=0
set foldignore=
