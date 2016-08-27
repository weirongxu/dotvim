" config
" autocmd BufEnter * setlocal autochdir " fixed some buf, in 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0

let start_pattern = join(['.', '~'], '\|')
let end_pattern = join(['.DS_Store', '.pyc', '.o'], '\|')
let g:vimfiler_ignore_pattern = '\V\%(\^\%('.start_pattern.'\)\|\%('.end_pattern.'\)\$\)'

" buffer config
autocmd FileType vimfiler call <SID>vimfiler_settings()
function! s:vimfiler_settings()
  nnoremap <silent><buffer><expr> v
        \ vimfiler#do_switch_action('vsplit')
  nnoremap <silent><buffer><expr> s
        \ vimfiler#do_switch_action('split')
  nnoremap <silent><buffer><expr> t
        \ vimfiler#do_switch_action('tabopen')

  nmap <buffer> V <Plug>(vimfiler_preview_file)
  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)

  nmap <2-LeftMouse> <Plug>(vimfiler_edit_file)

  nunmap <silent><buffer> <C-l>
  nmap <silent><buffer> R <Plug>(vimfiler_redraw_screen)

  nunmap <silent><buffer> <C-j>
  command! -buffer History call feedkeys("\<Plug>(vimfiler_switch_to_history_directory)")

  nunmap <silent><buffer> H
  command! -buffer Shell call feedkeys("\<Plug>(vimfiler_popup_shell)")

  nunmap <silent><buffer> L
  command! -buffer Drive call feedkeys("\<Plug>(vimfiler_switch_to_drive)")
endfunction

" isolate vimfiler by tab
let g:vimfiler_tab_index = 0
function! s:tab_id() "{{{
  if ! exists('t:vimfilter_tab_id')
    let g:vimfiler_tab_index = g:vimfiler_tab_index + 1
    let t:vimfilter_tab_id = g:vimfiler_tab_index
  endif
  return t:vimfilter_tab_id
endfunction "}}}

function! VimFilerExplorer()
  execute 'VimFilerBufferDir -explorer -auto-cd -split -buffer-name=' . s:tab_id()
endfunction

function! VimFilerExplorerDotVim()
  execute 'VimFiler -explorer -auto-cd -split -buffer-name=' . s:tab_id() . ' ' . $MY_VIMFILES
endfunction
nnoremap <silent> gn :call VimFilerExplorer()<CR>
nnoremap <silent> gp :call VimFilerExplorerDotVim()<CR>
