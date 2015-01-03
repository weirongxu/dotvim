autocmd FileType vimfiler call <SID>vimfiler_settings()
function! s:vimfiler_settings()
  nmap <buffer> t
        \ :<C-u>call vimfiler#mappings#do_action('tabopen')<CR>

  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)

  nmap <2-LeftMouse> <Plug>(vimfiler_edit_file)

  nunmap <buffer><silent> <C-l>
  nmap <buffer><silent> R <Plug>(vimfiler_redraw_screen)

  nunmap <buffer><silent> <C-j>
  command -buffer History call feedkeys("\<Plug>(vimfiler_switch_to_history_directory)")

  nunmap <buffer><silent> H
  command -buffer Shell call feedkeys("\<Plug>(vimfiler_popup_shell)")

  nunmap <buffer><silent> L
  command -buffer Drive call feedkeys("\<Plug>(vimfiler_switch_to_drive)")
endfunction
" autocmd BufEnter * setlocal autochdir " fixed some buf, in 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0

let start_pattern = join(['.', '~'], '\|')
let end_pattern = join(['.DS_Store', '.pyc', '.o'], '\|')
let g:vimfiler_ignore_pattern = '\V\%(\^\%('.start_pattern.'\)\|\%('.end_pattern.'\)\$\)'

let g:vimfiler_buf = 'VimFilerBufferDir -explorer -auto-cd -split'
let g:vimfiler_cmd = 'VimFiler -explorer -auto-cd -split'
execute 'map <silent> gn :' . g:vimfiler_buf .'<CR>'
execute 'map <silent> gp :' . g:vimfiler_cmd . ' ' . $MYVIMFILES . '<CR>'
