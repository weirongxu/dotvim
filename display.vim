" UI界面
if g:env#gui
  "if g:env#win
  " au GUIEnter * simalt ~x  " windows窗口启动时自动最大化
  "endif
  "winpos 20 20            " 指定窗口出现的位置，坐标原点在屏幕左上角
  "set lines=20 columns=90 " 指定窗口大小，lines为高度，columns为宽度
  set guioptions-=m    " 菜单栏
  set guioptions-=T    " 工具栏
  set guioptions-=l    " 左侧滚动条
  set guioptions-=r    " 右侧滚动条
  set guioptions-=b    " 底部滚动条
  set showtabline=1    " Tab 栏
endif

" Menu
command! Menu if &guioptions =~# 'm' <Bar>
      \set guioptions-=m <Bar>
      \set guioptions-=T <Bar>
      \set guioptions-=r <Bar>
      \else <Bar>
      \set guioptions+=m <Bar>
      \set guioptions+=T <Bar>
      \set guioptions+=r <Bar>
      \endif

" encoding
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,chinese,latin-1
set fileformats=unix,dos,mac

set fileencoding=utf-8
if g:env#gui || g:env#unix
  set encoding=utf-8
  set termencoding=utf-8
endif
if g:env#gui
  language messages en_US.UTF-8
  " language messages zh_CN.UTF-8
  set langmenu=en_US.UTF-8
  " set langmenu=zh_CN.UTF-8
endif

" Colorscheme
colo Tomorrow-Night-Eighties
" colo manuscript
" colo pyte
" colo molokai
" colo desertink
" colorscheme desert
" set background=dark


" t_Co gui-font
if g:env#x
  set t_Co=256
endif
if g:env#unix
  set guifont=Menlo\ 10,*
  " set guifont=Monofur\ For\ Powerline\ 10,*
  " set guifont=Source\ Code\ Pro\ 10,*
  " set guifont=SimSun\ for\ Powerline\ 10
  " set guifont=Courier\ New\ for\ Powerline\ 10
elseif g:env#win
  set guifont=Consolas:h11:cANSI,Courier_New_for_Powerline:h10:cANSI,*
  " set guifont=Source_Code_Pro:h9:cANSI
  " set guifont=monofur_for_Powerline:h10.5:w5,Courier_new:h10,*
endif

" set verbose=1

" compatible
set nocompatible " vi-compatible,
set mouse=a " support mouse

" edit show
" 去掉utf-8 BOM
set nobomb
set linespace=0
set ambiwidth=double
" set cursorline
" set cursorcolumn

" interface
set guitablabel=%t\ %M
set number
set showmatch
set scrolloff=5
set ruler " show cursor position
" Don't redraw while executing macros (good performance config)
" set lazyredraw

" cmd
set wildmenu " command complete menu inline
" set cmdheight=2
set laststatus=2

" break multi-line
" if g:env#gui
"    set nowrap
" endif
" set linebreak
" set textwidth=500
set backspace=indent,eol,start

" complete
set completeopt=longest,menu
set whichwrap+=<,>,[,],h,l

" 设置'_'连接的不为一个单词 (语法高亮出问题)
" set iskeyword-=_

" tab
set expandtab " tab use spaces
set shiftround
set tabstop=4 " Tab len
set softtabstop=4
set shiftwidth=4 " << >>
autocmd FileType css,less,vim,javascript,coffee setl tabstop=2 softtabstop=2 shiftwidth=2

" autoindent
set smartindent
set autoindent
set smarttab
set cindent

" search
set incsearch
set hlsearch
set ignorecase
set smartcase
set magic

" dir
set browsedir=buffer " file browse dir
set autochdir " change dir when into a buffer
set wildignore=*.o,*~,*.pyc " ignore file

set autoread " auto read when file changed outside of Vim

" sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" backup
if g:env#win
  set directory=$TMP
endif
set backup
set writebackup
set swapfile

" highlight 80 columns
" au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml setlocal colorcolumn=81
