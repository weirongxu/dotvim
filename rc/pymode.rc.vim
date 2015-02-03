let g:pymode_indent = 0
let g:pymode_folding = 1
let g:pymode_doc = 0
let g:pymode_virtualenv = 1
" TODO dynamic virtualenv path
" let g:pymode_virtualenv_path = expand('~/Envs')
" let g:pymode_lint = 0
let g:pymode_lint_on_write = 0
" let g:pymode_lint_ignore = "E501"
" let g:pymode_run = 0
" let g:pymode_breakpoint = 0
" let g:pymode_breakpoint_cmd = 'PymodeBreakpoints'


let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 0
let g:pymode_rope_regenerate_on_write = 0

au FileType python call <SID>pymodeRopeComplete()
au BufWritePost *.py call <SID>regenerate()

function! s:pymodeRopeComplete() "{{{
  inoremap <silent> <buffer> . .<C-R>=<SID>pymodeRopeCompleteOnDot()<CR>
  setlocal omnifunc=PymodeRopeCompletions
endfunction "}}}

function! s:check() "{{{
  return getcwd() != $HOME && ! empty(expand('%:p'))
endfunction "}}}

function! PymodeRopeCompletions(findstart, base) "{{{
  return s:check() ? pymode#rope#completions(a:findstart, a:base) : ''
endfunction "}}}

function! s:pymodeRopeCompleteOnDot() "{{{
  return  s:check() ? pymode#rope#complete_on_dot() : ''
endfunction "}}}

function! s:regenerate() "{{{
  if g:pymode_rope && b:pymode_modified && s:check()
    call pymode#debug('regenerate')
    call pymode#rope#regenerate()
  endif
endfunction "}}}
