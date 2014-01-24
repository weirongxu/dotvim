""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用一个额外的辅助键
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" like <leader>w saves the current file
let mapleader = ","
let maplocalleader = ','
" let g:mapleader = ","

" 快速保存和退出
nmap <CR> :w<CR>
nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>

" 只留下一个窗口
nmap <leader>o :only<CR>

" 分割窗口
nmap <leader>1 :vsplit<CR>
nmap <leader>2 :split<CR>
nmap <leader>3 :q!<cr>

" 打开配制文件
map gc :edit $MYVIMRC<CR>

" 打开插件目录
execute 'map gp :NERDTree ' . $MYVIMFILES . '<CR>'

" 打开终端
if has("unix") && has("gui_running")
  command SHELL :!gnome-terminal&
endif

" key Q open Ex mode very haite
map Q gq
noremap gQ Q

" 添加在可视模式下 退格键 删除功能
" vnoremap <BS> d

" SHIFT-Del 剪切
vnoremap <S-Del> "+x
vnoremap <leader><leader>x "+x
" CTRL-C and CTRL-Insert are Copy 复制
vnoremap <C-Insert> "+y
vnoremap <leader><leader>y "+y
" SHIFT-Insert 粘贴
map <S-Insert> "+p
map <leader><leader>p "+p

" 在visual和select模式中使用<leader>p,粘贴但不复制
xnoremap <expr> <leader>p 'pgv"'.v:register.'y'

" CTRL-S 保存
if has('gui_running')
    " imap <C-S> <ESC>:w<CR>
    " imap <M-s> <ESC>:w<CR>
    map <C-S> :w<CR>
    map <M-s> :w<CR>
    if has("mac") || has("macunix")
        imap <D-S> <ESC>:w<CR>
        map <D-S> :w<CR>
    endif
endif

" 用空格代替搜索
" map <SPACE> /
" map <leader><SPACE> ?

" 用于 web 开发的语法映射
nnoremap <C-F1> :set filetype=html<CR>
nnoremap <C-F2> :set filetype=css<CR>
nnoremap <C-F3> :set filetype=javascript<CR>
nnoremap <C-F4> :set filetype=php<CR>

" F4                 使用宏q
map <F4> @q


"""""""""""""""""""""""""""""""""""""
" 格式化,清除多余字符
"""""""""""""""""""""""""""""""""""""

" tab设定为格式化
" map <TAB> ==
" vnoremap <TAB> =

" TODO 将这些功能弄成一个menu那应该会好很多.

" 删除所有行首空格
nnoremap <F9> :%s/^[ ]\+//g<CR>

" 所有 中文全角空格 替换为 两个英文半角空格
nnoremap <C-F9> :%s/\%d41377/  /g<CR>

" tab转为4个空格
command TabToSpace :%s/\t/    /g

" 4个空格转为tab
command SpaceToTab :%s/    /\t/g

" 所有 中文全角数字 替换为 英文半角数字
fun! NumReplace()
  %s/\%d41904/0/g
  %s/\%d41905/1/g
  %s/\%d41906/2/g
  %s/\%d41907/3/g
  %s/\%d41908/4/g
  %s/\%d41909/5/g
  %s/\%d41910/6/g
  %s/\%d41911/7/g
  %s/\%d41912/8/g
  %s/\%d41913/9/g
endfunc
nnoremap <C-F10> :call NumReplace()<CR>

" 在行尾添加 ^M 字符 失败
" nnoremap <F10> :%s/$//g<CR>

" 清除php不标准的标签
command EchoPhpStd :%s/<?=/<?php echo /g<CR>
command TagPhpStd /^<?[^p]\|<?[^p]\|<?$\|^<?$<CR>laphp

" 删除所有行尾的 ^M 字符
nnoremap <F11> :%s/\r[ \t\r]*$//g<CR>
" 所有的 ^M  字符 替换为 换行符
nnoremap <C-F11> :%s/ *\r */\r/g<CR>

" 删除所有行未尾空格
nnoremap <F12> :%s/[ \t\r]\+$//g<CR>

" astyle --style=ansi   ansi格式化
" map <C-F12> :!astyle --style=ansi -s4 -b -p %<CR>
map <C-F12> :!astyle --style=java --indent=spaces=4 --pad-header --unpad-paren --break-closing-brackets --pad-oper %<CR>


"""""""""""""""""""""""""""""""""""""
" 界面和控制
"""""""""""""""""""""""""""""""""""""

" 移动一整行通过 ALT+[jk] 或 Comamnd+[jk] 在 mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
nmap <leader>j mz:m+<cr>`z
nmap <leader>k mz:m-2<cr>`z
vmap <leader>j :m'>+<cr>`<my`>mzgv`yo`z
vmap <leader>k :m'<-2<cr>`>my`<mzgv`yo`z
if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" 用alt键在插入模式下移动光标
imap <M-h> <ESC>i
imap <M-j> <ESC>ja
imap <M-k> <ESC>ka
imap <M-l> <ESC>la

" 窗口控制
map <C-Up> 5<c-w>+
map <C-Down> 5<c-w>-
map <C-Right> 5<c-w>>
map <C-Left> 5<c-w><
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
if has('gui')
  nmap <silent><S-Up> :call <SID>MoveUp(20)<CR>
  nmap <silent><S-Down> :call <SID>MoveDown(20)<CR>
  nmap <silent><S-Left> :call <SID>MoveLeft(20)<CR>
  nmap <silent><S-Right> :call <SID>MoveRight(20)<CR>

  function! s:MoveDown(d)
    let x = getwinposx()
    let y = getwinposy() + a:d
    execute "winp " . x . " " . y
  endfunction

  function! s:MoveUp(d)
    let x = getwinposx()
    let y = getwinposy() - a:d
    execute "winp " . x . " " . y
  endfunction

  function! s:MoveRight(d)
    let x = getwinposx() + a:d
    let y = getwinposy()
    execute "winp " . x . " " . y
  endfunction

  function! s:MoveLeft(d)
    let x = getwinposx() - a:d
    let y = getwinposy()
    execute "winp " . x . " " . y
  endfunction
endif

" 用系统窗口打开本文件目录
if has('win32')
  command E :!start explorer /select,%:p
  command Explorer :E
elseif has('unix')
  command E execute '!nautilus "'.expand('%:p').'" &'
  command Explorer :E
elseif has('mac')
  command E :!open %:p:h
  command Explorer :E
endif

" tab 控制
map gN :tab split<cr>
" map gq :tabclose<cr>
map <C-tab> :tabnext<cr>
map <S-l> :tabnext<cr>
map <C-S-tab> :tabprevious<cr>
map <S-h> :tabprevious<cr>

" alt + n , alt + p 时在折行里移动
map <m-p> gk
map <m-n> gj
if has("mac") || has("macunix")
  map <d-p> <m-p>
  map <d-n> <m-p>
endif

" 用ctrl + d, ctrl + f 来移动到行首和行尾
imap <c-d> <ESC>A
imap <c-f> <ESC>I

"""""""""""""""""""""""""""""""""""""
" 不同语言的设置
"""""""""""""""""""""""""""""""""""""

au FileType c,cpp,objc,objcpp,cs,javascript,php,java,css,less,sass,matlab,sql map  <silent> <buffer> ; :call <SID>AppendMark(';')<CR>
fun s:AppendMark(mark)
  let lines = getline('.')
  if match(lines, '[' . a:mark . '{}]\s*$') == -1
    call setline(line('.'), lines . a:mark)
  endif
endf

command EchoPath :echo expand("%:p")
