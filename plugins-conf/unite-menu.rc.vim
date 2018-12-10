" source menu
map <Leader>uu :Unite menu<CR>
map <Leader>ul :Unite menu:lang-tools<CR>
map <Leader><Leader>s :Unite menu:session<CR>
map <Leader>c :Unite menu:case-convert<CR>
let g:unite_source_menu_menus = {
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

let s:unite_filetype_tools = {
      \ '_': []
      \}

function! UniteFileTypeTool(types, conf) "{{{
  if type(a:types) == type('')
    call s:unite_filetype_tool_set(a:types, a:conf)
  elseif type(a:types) == type([])
    for l:type in a:types
      call s:unite_filetype_tool_set(l:type, a:conf)
    endfor
  endif
endfunction "}}}

function! s:unite_filetype_tool_set(type, conf) "{{{
  if ! empty(a:conf)
    let l:source_conf = get(s:unite_filetype_tools, a:type, [])
    let s:unite_filetype_tools[a:type] = l:source_conf + a:conf
  endif
endfunction "}}}

function! s:unite_menu_bind() "{{{
  if &filetype == 'unite'
    return
  endif
  call extend(g:unite_source_menu_menus, {
        \ 'lang-tools': {
        \   'description': 'Lang tools',
        \   'command_candidates': s:unite_filetype_tools['_'] + get(s:unite_filetype_tools, &filetype, []),
        \  }
        \ })
endfunction "}}}

autocmd BufEnter,FileType * call <SID>unite_menu_bind()
