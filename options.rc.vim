lang en_US.UTF-8

" UI
if g:env#gui
  set guioptions=
  set guitablabel=%t\ %M number showmatch ruler

  " Menu
  command! Menu if &guioptions =~# 'm' |
        \set guioptions-=mr |
        \else |
        \set guioptions+=mr |
        \endif
endif
set showtabline=2

set number
function! s:update_number(timer)
  if &buftype == 'terminal'
    setl nonumber
  endif
endfunction
autocmd BufCreate,BufCreate * call timer_start(100, function('s:update_number'))

set scrolloff=5

if &shell =~ 'fish'
  set shell=bash
endif

" encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,chinese,latin-1
set fileformats=unix,dos,mac

set fileencoding=utf-8 encoding=utf-8
set fileformat=unix

set background=dark

" t_Co gui-font
if g:env#x
  set t_Co=256
  set termguicolors
endif

" Colorscheme
try
  " colorscheme Tomorrow-Night-Eighties
  " colorscheme desert
  " colorscheme desertink
  " colorscheme manuscript
  " colorscheme pyte
  colorscheme PaperColor
catch /^Vim\%((\a\+)\)\=:E185/
  try
    colorscheme molokai
  catch /^Vim\%((\a\+)\)\=:E185/
  endtry
endtry

" if g:env#mac
"   set guifont=Monaco:h12
" elseif g:env#win
"   set guifont=Monaco:h10,Consolas:h11:cANSI,Courier_New_for_Powerline:h10:cANSI,*
"   " set guifont=Source_Code_Pro:h9:cANSI
"   " set guifont=monofur_for_Powerline:h10.5:w5,Courier_new:h10,*
" else
"   " set guifont=Menlo\ 10,*
"   set guifont=Monaco\ 10,*
"   " set guifont=Consolas\ 11
"   " set guifont=Monofur\ For\ Powerline\ 10,*
"   " set guifont=Source\ Code\ Pro\ 10,*
"   " set guifont=SimSun\ for\ Powerline\ 10
"   " set guifont=Courier\ New\ for\ Powerline\ 10
" endif

" set verbose=1

" compatible
if exists('&macmeta')
  set macmeta
endif
set nocompatible " vi-nocompatible
set mouse=a " support mouse

" chars display
set nobomb linespace=0 ambiwidth=single
set concealcursor=
set list listchars=tab:\|\ ,trail:.
" set cursorline cursorcolumn

try
  set signcolumn=auto:2
catch
  set signcolumn=auto
endtry
function! s:update_sign(timer)
  if ! &readonly && &buftype != 'nofile' && &buftype != 'terminal'  && bufname('%') != ''
    try
      setl signcolumn=yes:2
    catch
      setl signcolumn=yes
    endtry
  endif
endfunction
autocmd BufEnter,BufCreate * call timer_start(100, function('s:update_sign'))

" cmd
set wildmenu " command complete menu inline
set cmdheight=2
set laststatus=2
set shortmess=aoOtFT

" break multi-line
" set nowrap
" set linebreak
set formatoptions+=m
" set textwidth=78
set backspace=indent,eol,start
set whichwrap+=<,>,[,],h,l

" complete
set completeopt=longest,menu
if exists("+pumblend")
  set pumblend=20
endif

" buffer
set hidden

" diff
if has('patch-8.1.0360')
  set diffopt+=internal,algorithm:patience,indent-heuristic
endif

" pairs
set matchpairs+=（:）,《:》

" indent
set expandtab " tab use spaces
set shiftround
set tabstop=4 " Tab len
set softtabstop=4
set shiftwidth=4 " << >>
set nosmartindent autoindent smarttab nocindent

" search
set incsearch hlsearch ignorecase smartcase magic

" dir
set browsedir=buffer " file browse dir
set noautochdir
set wildignore=

set autoread
set splitright

set clipboard-=autoselect

" bell
set noerrorbells visualbell t_vb= tm=500
autocmd GUIEnter * set vb t_vb=

if !g:env#win
  " backup
  for it in [['undodir', 'undo'], ['backupdir', 'backup'], ['directory', 'swap']]
    let dir = g:env#tmp . '/' . it[1]
    if !isdirectory(dir)
      call mkdir(dir, 'p', 0700)
    endif
    execute printf('let &%s = "%s"', it[0], dir)
  endfor
  set undofile
  set backup writebackup swapfile
  set updatetime=300
endif

" highlight 80th column
function! s:set_colorcolumn() "{{{
  let exclude_ft_list = ['startify|coc-explorer|tagbar'] + g:env#html_type_list
  if &ft =~ '\v(^$|'. join(exclude_ft_list, '|') .')'
    set colorcolumn=
    return
  endif
  set colorcolumn=81
endfunction "}}}
autocmd FileType * call s:set_colorcolumn()
autocmd BufEnter * :syntax sync fromstart

" fold
autocmd FileType coffee,jade,stylus,sass setl foldmethod=indent foldlevel=0
set foldignore=
