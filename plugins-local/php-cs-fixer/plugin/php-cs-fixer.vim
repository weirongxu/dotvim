let s:save_cpo = &cpo
set cpo&vim

let s:command_prefix = 'php-cs-fixer fix'
" let s:fixer = ['short_tag', 'braces', 'elseif', 'function_call_space', 'function_declaration', 'indentation', '']
let s:level = 'symfony'

function! s:exec_fixer() "{{{
  let v = vital#of('vital')
  let process = v.import('Process')
  call process.system(s:command_prefix . ' ' . expand('%:p') . ' --level=' . s:level)
endfunction "}}}
command! PhpFixer call <SID>exec_fixer()

call FileTypeTool('php', [
      \ ['php-fixer', 'PhpFixer']
      \ ])

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: fdm=marker
