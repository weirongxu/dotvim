function! AddCommand(id, command, ...) "{{{
  if exists('*coc#add_command')
    call coc#add_command(a:id, a:command, get(a:, 1, ''))
  endif
endfunction "}}}
