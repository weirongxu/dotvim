"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 使用一个额外的辅助键
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" like <leader>w saves the current file
let mapleader = ","
let maplocalleader = ","
noremap ,; ,

" 快速保存
" nmap <silent> <CR> :up<CR>
" 很多插件不支持update
nmap <silent> <CR> :w<CR>

" fold
noremap <RightMouse> <LeftMouse>za
noremap <2-LeftMouse> <LeftMouse>zA

" 只留下一个窗口
nmap <leader>o :only<CR>

" 分割窗口
" nmap <silent> <leader>1 :vsplit<CR>
" nmap <silent> <leader>2 :split<CR>
" nmap <silent> <leader>3 :q!<cr>

" key Q open Ex mode very haite
map Q gq
noremap gQ Q

" SHIFT-Del 剪切
vnoremap <S-Del> "+x
vnoremap <leader>x "+x
" CTRL-C and CTRL-Insert are Copy 复制
vnoremap <C-Insert> "+y
vnoremap <leader>y "+y
" SHIFT-Insert 粘贴
map <S-Insert> "+p
map <leader>p "+p
map <leader>P "+P

" F4                 使用宏q
map <F4> @q

" align code
map <leader>c :set cuc!<CR>

"""""""""""""""""""""""""""""""""""""
" 格式化,清除多余字符
"""""""""""""""""""""""""""""""""""""

function! s:FixWhitespace(line1,line2)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\v(\s|\r)+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)

" TODO 将这些功能弄成一个menu那应该会好很多.
" 比如用unite, 不过兼容性会下降吧.
" such as unite and textshift.vim

" 删除所有行首空格
nnoremap <F9> :%s/^[ ]\+//g<CR>

" 所有 中文全角空格 替换为 两个英文半角空格
nnoremap <C-F9> :%s/\%d41377/  /g<CR>

" tab转为4个空格
command! TabToSpace :%s/\t/    /g

" 4个空格转为tab
command! SpaceToTab :%s/    /\t/g

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
command! EchoPhpStd :%s/<?=/<?php echo /g<CR>
command! TagPhpStd /^<?[^p]\|<?[^p]\|<?$\|^<?$<CR>laphp

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
" html转换
"""""""""""""""""""""""""""""""""""""
let s:html_escape_dict = {
      \ '"': 'quot',
      \ "'": 'apos',
      \ '&': 'amp',
      \ '<': 'lt',
      \ '>': 'gt',
      \ ' ': 'nbsp',
      \ }
function! s:HtmlEscape()
  for k in keys(s:html_escape_dict)
    exec 'silent s/\V'.k.'/&'.s:html_escape_dict[k].';/eg'
  endfor
endfunction

function! s:HtmlUnEscape()
  for k in keys(s:html_escape_dict)
    exec 'silent s/\V&'.s:html_escape_dict[k].';/'.k.'/eg'
  endfor
endfunction

nmap <silent> <Leader>he v<Leader>he
nmap <silent> <Leader>hu v<Leader>hu
vmap <silent> <Leader>he :call <SID>HtmlEscape()<CR>
vmap <silent> <Leader>hu :call <SID>HtmlUnEscape()<CR>


"""""""""""""""""""""""""""""""""""""
" 界面和控制
"""""""""""""""""""""""""""""""""""""

" 用alt键在插入模式下移动光标
imap <silent> <M-h> <ESC>i
imap <silent> <M-j> <ESC>ja
imap <silent> <M-k> <ESC>ka
imap <silent> <M-l> <ESC>la

" 窗口控制
map <silent> <C-W><Up> 5<c-w>+
map <silent> <C-W><Down> 5<c-w>-
map <silent> <C-W><Right> 5<c-w>>
map <silent> <C-W><Left> 5<c-w><
map <silent> <C-h> :wincmd h<cr>
map <silent> <C-j> :wincmd j<cr>
map <silent> <C-k> :wincmd k<cr>
map <silent> <C-l> :wincmd l<cr>

" tab control
map <silent> gN :tab split<cr>
" map gq :tabclose<cr>
map <silent> <C-tab> :tabnext<cr>
map <silent> <S-l> :tabnext<cr>
map <silent> <C-S-tab> :tabprevious<cr>
map <silent> <S-h> :tabprevious<cr>
map <silent> <S-Left> :tabmove -1<cr>
map <silent> <S-Right> :tabmove +1<cr>

" jump to end of line while in Insert Mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>I

" Tab 长度 设置
command! -nargs=1 TabLen call <sid>TabLen(<f-args>)
command! -nargs=1 TabLenLocal call <sid>TabLenLocal(<f-args>)
function! s:TabLen(n)
  " 设定 Tab 长度
  let &tabstop = a:n
  " 设置 Backspace 可以一次删除掉4个空格
  let &softtabstop = a:n
  " 设定 << 和 >> 移动的宽度
  let &shiftwidth = a:n
endfunction
function! s:TabLenLocal(n)
  let &l:tabstop = a:n
  let &l:softtabstop = a:n
  let &l:shiftwidth = a:n
endfunction


"""""""""""""""""""""""""""""""""""""
" 不同语言的设置
"""""""""""""""""""""""""""""""""""""

nmap <silent> <M-;> :call <SID>AppendMark(';')<CR>
fun! s:AppendMark(mark)
  let lines = getline('.')
  if match(lines, '[' . a:mark . '{]\s*$') == -1
    call setline(line('.'), lines . a:mark)
  endif
endf



"""""""""""""""""""""""""""""""""""""
" 其它设置
"""""""""""""""""""""""""""""""""""""
" command! EchoPath echo expand("%:p")
command! CdHere exec 'cd ' expand("%:p:h")
