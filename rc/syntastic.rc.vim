if g:env#win
  let g:syntastic_error_symbol = '>x'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
else
  let g:syntastic_error_symbol = ">\u2717"
  let g:syntastic_style_error_symbol = "S\u2717"
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
endif
" let g:syntastic_php_checkers=['php']
let quiet_php_messages = [
      \ 'comment',
      \ ]
let g:syntastic_php_phpcs_quiet_messages = {
      \ "regex": '\V\('.join(quiet_php_messages, '\|').'\)',
      \ }
let g:syntastic_python_checkers = ['flake8']
let quiet_python_messages = [
      \ 'E501',
      \ 'E111',
      \ ]
let g:syntastic_python_flake8_quiet_messages = {
      \ "regex": '\V\('.join(quiet_python_messages, '\|').'\)',
      \ }
let quiet_coffee_messages = [
      \ 'indentation Expected',
      \ 'Line exceeds maximum',
      \ ]
let g:syntastic_coffee_coffeelint_quiet_messages = {
      \ "regex": '\V\('.join(quiet_coffee_messages).'\|\)',
      \ }
map <Leader><space> :up<CR>:SyntasticCheck<CR>
      " \ 'mode': 'active',
let g:syntastic_mode_map = {
      \   'mode': 'passive',
      \   'active_filetypes': [],
      \   'passive_filetypes': ['java', 'less']
      \ }
