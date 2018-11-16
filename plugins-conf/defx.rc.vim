let s:tab_id_max = 0
function! s:tab_id() "{{{
  if ! exists('t:defx_tab_id')
    let s:tab_id_max = s:tab_id_max + 1
    let t:defx_tab_id = s:tab_id_max
  endif
  return t:defx_tab_id
endfunction "}}}

function! DefxExplorer(dir)
  execute 'Defx -toggle -split=vertical -winwidth=50 -direction=topleft -columns=git:mark:filename:type -buffer-name=' . s:tab_id() . ' ' . a:dir
endfunction

nnoremap <silent> ge :call DefxExplorer("`expand('%:p:h')`")<CR>
nnoremap <silent> gE :call DefxExplorer("`$MY_VIMFILES`")<CR>
function! s:defx_settings()
  nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> l     defx#do_action('drop')
  nnoremap <silent><buffer><expr> E     defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> t     defx#do_action('drop', 'tabnew')
  nnoremap <silent><buffer><expr> P     defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> K     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> A     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> D     defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> h     defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> *     defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> <C-a> defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> R     defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')

  nmap <silent><buffer> ge q
endfunction
autocmd FileType defx call <SID>defx_settings()

Pkg pip3 install Send2Trash
