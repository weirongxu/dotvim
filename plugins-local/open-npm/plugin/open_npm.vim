let s:save_cpo = &cpo
set cpo&vim

command! Npmhome call open_npm#open()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: fdm=marker
