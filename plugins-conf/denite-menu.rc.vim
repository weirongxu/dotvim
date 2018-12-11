" source menu
map <Leader>lm :Denite menu<CR>
map <Leader>ll :Denite menu:lang-tools<CR>
map <Leader><Leader>s :Denite menu:session<CR>
map <Leader>c :Denite menu:case-convert<CR>
let s:denite_menus = {
      \ 'session': {
      \   'description': 'Session Manager',
      \   'command_candidates': [
      \     ['session save', "SSave"],
      \     ['session load', "SLoad"],
      \     ['session delete', "SDelete"],
      \     ['session close', "SClose"],
      \   ],
      \ },
      \ 'case-convert': {
      \   'description': 'Snake Case, Hyphenation and Camel Case Converter',
      \   'command_candidates': [
      \     ['CamelToHyphen', 'CamelToHyphen'],
      \     ['CamelToSnake', 'CamelToSnake'],
      \     ['HyphenToCamel', 'HyphenToCamel'],
      \     ['HyphenToSnake', 'HyphenToSnake'],
      \     ['SnakeToCamel', 'SnakeToCamel'],
      \     ['SnakeToHyphen', 'SnakeToHyphen'],
      \   ],
      \ },
      \ 'common-tools': {
      \   'description': 'Common Tools',
      \   'command_candidates': [
      \     ['rand password to reg', "call setreg('\"', RandPasswordInput())"],
      \     ['rand words password to reg', "call setreg('\"', RandPasswordInputOnlyWord())"],
      \   ],
      \ },
      \ }

function! s:filetype_menu() "{{{
  if &filetype == 'denite'
    return
  endif
  call extend(s:denite_menus, {
        \ 'lang-tools': {
        \   'description': 'Lang tools',
        \   'command_candidates': g:filetype_tools['_'] + get(g:filetype_tools, &filetype, []),
        \  }
        \ })
  call denite#custom#var('menu', 'menus', s:denite_menus)
endfunction "}}}

autocmd BufEnter,FileType * call <SID>filetype_menu()
call denite#custom#var('menu', 'menus', s:denite_menus)
