" source menu
map <Leader>lm :Denite menu<CR>
map <Leader>lmf :Denite menu:filetype-menu<CR>
map <Leader><Leader>c :Denite menu:case-convert<CR>

let g:menus = extend(g:menus, {})

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
