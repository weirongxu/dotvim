let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0

let g:vimfiler_ignore_pattern = ['\v^(\.|\~)']
let g:vimfiler_ignore_pattern += map(deepcopy(g:env#hidden_dir_list), '"\\V".v:val')
let g:vimfiler_ignore_pattern += ['\v\.('. join(g:env#hidden_ext_list, '|') .')$']

autocmd FileType vimfiler call <SID>vimfiler_settings()
function! s:vimfiler_settings()
  nunmap <buffer> <C-l>
  nunmap <buffer> <C-j>
  nunmap <buffer> <Space>
  nunmap <buffer> <S-Space>
  nunmap <buffer> H
  nunmap <buffer> L
  nunmap <buffer> N

  nmap <buffer><expr> v             vimfiler#do_switch_action('vsplit')
  nmap <buffer><expr> s             vimfiler#do_switch_action('split')
  nmap <buffer><expr> t             vimfiler#do_switch_action('tabopen')
  nmap <buffer>       V             <Plug>(vimfiler_preview_file)
  nmap <buffer>       <2-LeftMouse> <Plug>(vimfiler_edit_file)
  nmap <buffer>       A             <Plug>(vimfiler_new_file)
  nmap <buffer>       R             <Plug>(vimfiler_redraw_screen)
  nmap <buffer>       "             <Plug>(vimfiler_toggle_mark_current_line)
  command! -buffer History call feedkeys("\<Plug>(vimfiler_switch_to_history_directory)")
  command! -buffer Drive   call feedkeys("\<Plug>(vimfiler_switch_to_drive)")

  nmap <silent><buffer> ge q
endfunction

function! VimFilerExplorer()
  execute 'VimFilerBufferDir -explorer -auto-cd -split'
endfunction

function! VimFilerExplorerDotVim()
  execute 'VimFiler -explorer -auto-cd -split ' . $MY_VIMFILES
endfunction
nnoremap <silent> ge :call VimFilerExplorer()<CR>
nnoremap <silent> gE :call VimFilerExplorerDotVim()<CR>
command! VimConfig call VimFilerExplorerDotVim()<CR>
