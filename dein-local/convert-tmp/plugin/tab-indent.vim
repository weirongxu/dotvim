" Tab indent length
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

command! -nargs=1 TabLen call <sid>TabLen(<f-args>)
command! -nargs=1 TabLenLocal call <sid>TabLenLocal(<f-args>)
