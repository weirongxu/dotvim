" UI界面
if has("gui_running")
  "if has("win32")
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

" gvim 菜单栏与工具栏隐藏与显示动态切换
" 在必要时，可使用 Menu 键呼出菜单栏/工具栏；待不使用时，用 Menu 键将其关闭。
command! Menu if &guioptions =~# 'm' <Bar>
      \set guioptions-=m <Bar>
      \set guioptions-=T <Bar>
      \set guioptions-=r <Bar>
      \else <Bar>
      \set guioptions+=m <Bar>
      \set guioptions+=T <Bar>
      \set guioptions+=r <Bar>
      \endif

" 识别的文件编码
set fileencodings=utf-8,gb18030,gbk,gb2312,cp936,ucs-bom,chinese,latin-1

" 语言与编码设置
set fileencoding=utf-8
if has('gui_running') || has('unix')
  set encoding=utf-8
  set termencoding=utf-8
endif
if has("gui_running")
  language messages en_US.UTF-8
  " language messages zh_CN.UTF-8
  set langmenu=en_US.UTF-8
  " set langmenu=zh_CN.UTF-8
endif

" 配色
" colo manuscript
" colo pyte
" colo molokai
colo desertink
" colorscheme desert
" set background=dark


" 颜色和字体
if has("unix")
  set t_Co=256
  " set guifont=Monofur\ For\ Powerline\ 10,*
  set guifont=Source\ Code\ Pro\ 10,*
  " set guifont=SimSun\ for\ Powerline\ 10
  " set guifont=Courier\ New\ for\ Powerline\ 10
elseif has("win32")
  set guifont=Courier_New_for_Powerline:h10:cANSI
  " set guifont=Source_Code_Pro:h9:cANSI
  " set guifont=monofur_for_Powerline:h10.5:w5,Courier_new:h10,*
endif

if has('win32')
  set directory=$TMP
endif

set linespace=0

" 双字节宽度
set ambiwidth=double

" 防止tab名太长
set guitablabel=%t\ %M

" 调试模式
" set verbose=1

" 去掉utf-8 BOM
set nobomb

" 高亮光标所在行列
" set cursorline
" set cursorcolumn

" 显示行号
set number

" 高亮显示括号配对
set showmatch

" 在命令模式下使用 Tab 自动补全的时，将补全内容用一个单行菜单显示出来
set wildmenu

" GUI 下不折行
" if has("gui_running")
"    set nowrap
" endif

" 智能补全时，不显示预览窗口
set completeopt=longest,menu

" 关闭 vi 兼容模式
set nocompatible

" 设置'_'连接的不为一个单词 (语法高亮出问题)
" set iskeyword-=_

" 鼠标支持
set mouse=a

" 设定 Tab 长度
set tabstop=4
" 设置 Backspace 可以一次删除掉4个空格
set softtabstop=4
" 设定 << 和 >> 移动的宽度
set shiftwidth=4

autocmd FileType css,less,vim,coffee setl tabstop=2 softtabstop=2 shiftwidth=2

" 使用空格替代 Tab
" au BufRead,BufNewFile *.py set expandtab
set expandtab

" 自动缩进
set smartindent
" set cindent
set autoindent
set smarttab

" 增量搜索
set incsearch

" 搜索时高亮显示被找到的文本
set hlsearch

" 搜索时忽略大小写
set ignorecase

" 搜索时智能选择是否忽略大小写
set smartcase

" 设置正则表达式是否要加反斜杠
" set magic

" Backspace 可以删除行首/尾
set backspace=indent,eol,start

" 光标夸行移动
set whichwrap+=<,>,[,],h,l

" 当垂直的用j,k来移动光标时,隔下面还有5行就滚屏
set so=5

" 设定文件浏览器目录为当前目录
set bsdir=buffer

" 自动切换目录
set autochdir

" 当文件在外部被改变时，自动读取
set autoread

" 忽略编译的文件
set wildignore=*.o,*~,*.pyc

" 总是显示现在位置
set ruler

" 命令行的高度
" set cmdheight=2

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" 没有出错提示声
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git et.c anyway...
" 不使用备份
" set nobackup
" nowb == no write backup
" set nowb
" 不使用交换文件,将编辑文件保存在内存中
" set noswapfile

" 每行超过80个的字符用下划线标示
" au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml 2match Underlined /.\%81v/
au BufRead,BufNewFile *.s,*.asm,*.h,*.c,*.cpp,*.cc,*.java,*.cs,*.erl,*.hs,*.sh,*.lua,*.pl,*.pm,*.php,*.py,*.rb,*.erb,*.vim,*.js,*.css,*.xml,*.html,*.xhtml setlocal colorcolumn=81

" 总显示最后一个窗口的状态行；设为1则窗口数多于一个的时候显示最后一个窗口的状态行；0不显示最后一个窗口的状态行
set laststatus=2


" 设制折行
" set lbr
" set tw=500
