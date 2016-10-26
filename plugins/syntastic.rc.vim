if g:env#win
  let g:syntastic_error_symbol = '>x'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
else
  " let g:syntastic_error_symbol = ">\u2717"
  " let g:syntastic_style_error_symbol = "S\u2717"
  let g:syntastic_error_symbol = '>x'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
endif

function! s:config(type, quiet_messages) "{{{
  let quiet_messages = a:quiet_messages
  let g:syntastic_{a:type}_quiet_messages = {
        \ "regex": '\V\('.join(quiet_messages, '\|').'\)',
        \ }
endfunction "}}}

" let g:syntastic_php_checkers=['php']
call s:config('php_phpcs', [
      \ 'comment',
      \ ])

call s:config('php_phpmd', [
      \ 'variables with short names',
      \ 'Cyclomatic complexity',
      \ 'NPath complexity',
      \ 'Avoid really long methods',
      \ 'keep the number of fields under',
      \ 'contains an exit expression',
      \ 'returns a boolean should be named',
      \ 'has an overall complexity',
      \ ])

let g:syntastic_python_checkers = ['flake8']
call s:config('python_flake8', [
      \ 'E501',
      \ 'E111',
      \ 'E121',
      \ ])

call s:config('coffee_coffeelint', [
      \ 'indentation Expected',
      \ 'Line exceeds maximum',
      \ ])

call s:config('javascript_jshint', [
      \ 'Missing semicolon.',
      \ 'ES6',
      \ ])


map <Leader><space> :up<CR>:SyntasticCheck<CR>
let g:syntastic_mode_map = {
      \   'mode': 'active',
      \   'active_filetypes': [],
      \   'passive_filetypes': ['java', 'less']
      \ }
