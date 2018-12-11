" source menu
map <Leader>lm :Denite menu<CR>
map <Leader>ll :Denite menu:lang-tools<CR>
map <Leader>c :Denite menu:case-convert<CR>

let g:menus = extend(g:menus, {
      \ 'random-string': {
      \   'description': 'Random string',
      \   'command_candidates': [
      \     ['rand password to reg', "call setreg('\"', RandPasswordInput())"],
      \     ['rand words password to reg', "call setreg('\"', RandPasswordInputOnlyWord())"],
      \   ],
      \ },
      \})
call MenuFileType('php', [
      \ ['php-fixer', 'PhpFixer']
      \ ])

function! s:filetype_menu() "{{{
  if &filetype == 'denite'
    return
  endif
  call extend(g:menus, {
        \ 'filetype-menu': {
        \   'description': 'Filetype menu',
        \   'command_candidates': g:filetype_menus['_'] + get(g:filetype_menus, &filetype, []),
        \  }
        \ })
  call denite#custom#var('menu', 'menus', g:menus)
endfunction "}}}

autocmd BufEnter,FileType * call <SID>filetype_menu()
call denite#custom#var('menu', 'menus', g:menus)
