nmap U :Unite
map <Leader>u :UniteResume<cr>
" let g:unite_source_menu_menus = {}
" let g:unite_source_menu_menus.buffer = {
"       \ 'description' : 'vim buffer',
"       \ }
" let g:unite_source_menu_menus.buffer.candidates = {
"       \ 'Unite buffer' : 'Unite buffer',
"       \ }
" let g:unite_source_menu_menus.bookmarks = {
"       \ 'description' : 'bookmarks',
"       \}
" let g:unite_source_menu_menus.bookmarks.command_candidates = [
"       \ ['open bookmarks', 'Unite bookmark:*'],
"       \ ['add bookmark', 'UniteBookmarkAdd'],
"       \]

" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_winheight = 10
" let g:unite_force_overwrite_statusline = 0

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <Leader>f :Unite vimgrep:
nnoremap <Leader><s-f> :Unite vimgrep:%<CR>
" nnoremap <c-p> :Unite -buffer-name=files -start-insert file_rec<cr>

autocmd FileType unite call <SID>unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <c-h> unite#do_action('rec_parent')

  map <silent><buffer><expr> x unite#do_action('split')
  map <silent><buffer><expr> s unite#do_action('split')
  map <silent><buffer><expr> v unite#do_action('vsplit')

  imap <buffer> <c-q> <Plug>(unite_exit)
  nmap <buffer> <c-q> <Plug>(unite_exit)
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
""""""""""""""""""""""""""""""
let g:unite_source_history_yank_enable = 1
let g:unite_source_grep_max_candidates = 0
let g:unite_source_find_max_candidates = 0
call unite#custom_max_candidates('vimgrep', 0)

if executable('ag')
  " Use ag in unite grep source.
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts =
        \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --ignore ''node_modules'''
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
