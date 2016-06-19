" TODO 将这些功能弄成一个menu那应该会好很多.
" 比如用unite, 不过兼容性会下降吧.
" such as unite and textshift.vim
" " 删除所有行首空格
" nnoremap <F9> :%s/^[ ]\+//g<CR>
"
" " 所有 中文全角空格 替换为 两个英文半角空格
" nnoremap <C-F9> :%s/\%d41377/  /g<CR>
"
" " tab转为4个空格
" command! TabToSpace :%s/\t/    /g
"
" " 4个空格转为tab
" command! SpaceToTab :%s/    /\t/g
"
" " 所有 中文全角数字 替换为 英文半角数字
" fun! NumReplace()
"   %s/\%d41904/0/g
"   %s/\%d41905/1/g
"   %s/\%d41906/2/g
"   %s/\%d41907/3/g
"   %s/\%d41908/4/g
"   %s/\%d41909/5/g
"   %s/\%d41910/6/g
"   %s/\%d41911/7/g
"   %s/\%d41912/8/g
"   %s/\%d41913/9/g
" endfunc
" nnoremap <C-F10> :call NumReplace()<CR>
"
" " 在行尾添加 ^M 字符 失败
" " nnoremap <F10> :%s/$//g<CR>
"
" " 清除php不标准的标签
" command! EchoPhpStd :%s/<?=/<?php echo /g<CR>
" command! TagPhpStd /^<?[^p]\|<?[^p]\|<?$\|^<?$<CR>laphp
"
" " 删除所有行尾的 ^M 字符
" nnoremap <F11> :%s/\r[ \t\r]*$//g<CR>
" " 所有的 ^M  字符 替换为 换行符
" nnoremap <C-F11> :%s/ *\r */\r/g<CR>
"
" " 删除所有行未尾空格
" nnoremap <F12> :%s/[ \t\r]\+$//g<CR>
"
" " astyle --style=ansi   ansi格式化
" " map <C-F12> :!astyle --style=ansi -s4 -b -p %<CR>
" map <C-F12> :!astyle --style=java --indent=spaces=4 --pad-header --unpad-paren --break-closing-brackets --pad-oper %<CR>
