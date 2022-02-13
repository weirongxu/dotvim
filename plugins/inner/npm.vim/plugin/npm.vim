let s:save_cpo = &cpo
set cpo&vim

command! NpmRepo call npm#repo#open()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: fdm=marker
