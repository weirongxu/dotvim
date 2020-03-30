let s:tab_id_max = 0
function! s:tab_id()
  if ! exists('t:defx_tab_id')
    let s:tab_id_max = s:tab_id_max + 1
    let t:defx_tab_id = s:tab_id_max
  endif
  return t:defx_tab_id
endfunction

function! s:custom_options()
        "\ 'session-file': g:env#record_dir#defx_sessions . '/default.vim',
  call defx#custom#option('_', {
        \ 'columns': 'git:mark:indent:icon:filename:type:size:time',
        \ })
endfunction

call dein#set_hook('defx.nvim', 'hook_post_source', function('s:custom_options'))

function! DefxExplorer(dir, reveal)
  let l:cmd = join([
        \ 'Defx',
        \ '-toggle',
        \ '-split=vertical',
        \ '-winwidth=50',
        \ '-direction=topleft',
        \ '-buffer-name=' . s:tab_id(),
        \ ' -search=' . a:reveal,
        \], ' ')
  execute l:cmd . ' ' . a:dir
endfunction

nnoremap <silent> <leader>ge :call DefxExplorer("`getcwd()`", "`expand('%:p')`")<CR>
nnoremap <silent> <leader>gE :call DefxExplorer("`$MY_VIMFILES`", "`$MY_PLUGINS`")<CR>
function! s:defx_settings()
  nnoremap <silent><buffer><expr> <CR>  defx#do_action('open')
  nnoremap <silent><buffer><expr> <BS>  defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> c     defx#do_action('copy')
  nnoremap <silent><buffer><expr> m     defx#do_action('move')
  nnoremap <silent><buffer><expr> p     defx#do_action('paste')
  nnoremap <silent><buffer><expr> o     defx#do_action('open_or_close_tree')
  nnoremap <silent><buffer><expr> O     defx#do_action('open_tree_recursive')
  nnoremap <silent><buffer><expr> h     defx#do_action('close_tree')
  nnoremap <silent><buffer><expr> l     defx#is_directory() ? defx#do_action('open_tree') : defx#do_action('drop')
  nnoremap <silent><buffer><expr> E     defx#do_action('drop', 'vsplit')
  nnoremap <silent><buffer><expr> s     defx#do_action('open', 'botright split')
  nnoremap <silent><buffer><expr> t     defx#do_action('drop', 'tabnew')
  nnoremap <silent><buffer><expr> P     defx#do_action('drop', 'pedit')
  nnoremap <silent><buffer><expr> a     defx#do_action('new_file')
  nnoremap <silent><buffer><expr> A     defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> d     defx#do_action('remove_trash')
  nnoremap <silent><buffer><expr> D     defx#do_action('remove')
  nnoremap <silent><buffer><expr> r     defx#do_action('rename')
  nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy    defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ~     defx#do_action('cd')
  nnoremap <silent><buffer><expr> q     defx#do_action('quit')
  nnoremap <silent><buffer><expr> <C-k> defx#do_action('toggle_select') . 'k'
  nnoremap <silent><buffer><expr> <C-j> defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> <C-a> defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> j     line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k     line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> R     defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
  nnoremap <silent><buffer><expr> cd    defx#do_action('change_vim_cwd')

  nmap <silent><buffer>       [c    <Plug>(defx-git-prev)
  nmap <silent><buffer>       ]c    <Plug>(defx-git-next)

  nmap <silent><buffer> ge q
endfunction
autocmd FileType defx call <SID>defx_settings()

Pkg pip3 install Send2Trash
