function! AddCommand(id, command, ...) "{{{
  call coc#add_command(a:id, a:command, get(a:, 1, ''))
endfunction "}}}
