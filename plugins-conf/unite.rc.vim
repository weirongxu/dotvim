nmap U :Unite
map <Leader>u :UniteResume<CR>
map <Leader>U :Unite history/command<CR>
map <Space>b :Unite buffer<CR>
map <Space>t :Unite tab<CR>
map <Space>T :Unite tab:no-current<CR>
map <Space>j :Unite jump<CR>
map <Space>c :Unite change<CR>
map <Space>g :Unite grep:
map <Space>G :Unite grep:%<CR>
map <Space>f :Unite vimgrep:
map <Space>F :Unite vimgrep:%<CR>
map <Space>hc :Unite history/command<CR>
map <Space>hs :Unite history/search<CR>
map <Space>hy :Unite history/yank<CR>

" config
let g:unite_source_grep_max_candidates = 0
let g:unite_source_find_max_candidates = 0

if executable('ag')
  " Use ag in unite grep source.
  let ag_ignore = ['.hg', '.svn', '.git', '.bzr', '.ropeproject', 'node_modules', 'bower_components']
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden ' .
        \ join(map(ag_ignore, '"--ignore ''" . v:val . "''"'))
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '-i --nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('jvgrep')
  " For jvgrep.
  let g:unite_source_grep_command = 'jvgrep'
  let g:unite_source_grep_default_opts = '-i --exclude ''\.(git|svn|hg|bzr)'''
  let g:unite_source_grep_recursive_opt = '-R'
elseif executable('ack-grep')
  " For ack.
  let g:unite_source_grep_command = 'ack-grep'
  let g:unite_source_grep_default_opts = '-i --no-heading --no-color -a'
  let g:unite_source_grep_recursive_opt = ''
endif

" buffer config
autocmd FileType unite call <SID>unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-h> unite#do_action('rec_parent')

  map <silent><buffer><expr> x unite#do_action('split')
  map <silent><buffer><expr> s unite#do_action('split')
  map <silent><buffer><expr> v unite#do_action('vsplit')

  imap <silent><buffer> <C-q> <Plug>(unite_exit)
  nmap <silent><buffer> <C-q> <Plug>(unite_exit)
  nmap <silent><buffer> <ESC> <Plug>(unite_exit)
  nunmap <silent><buffer> <C-l>
  nmap <silent><buffer> R <Plug>(unite_redraw)
endfunction
