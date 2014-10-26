let g:ibus#enabled = 0
function! s:inseart_leave() "{{{
  let g:ibus#enabled = ibus#is_enabled()
  call ibus#disable()
endfunction "}}}
function! s:inseart_enter() "{{{
  if g:ibus#enabled
    call ibus#enable()
  endif
endfunction "}}}
au InsertLeave * call s:inseart_leave()
au InsertEnter * call s:inseart_enter()
nmap <silent> <c-_> :let g:ibus#enabled=1-g:ibus#enabled<cr>
imap <silent> <c-_> <c-o>:let g:ibus#enabled=1-g:ibus#enabled<cr>