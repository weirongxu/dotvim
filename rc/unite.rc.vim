nmap U :Unite
map <Leader>u :UniteResume<CR>
" map <space> :Unite
map <space>b :Unite buffer<CR>
map <space>t :Unite tab<CR>
map <space>T :Unite tab:no-current<CR>
map <space>j :Unite jump<CR>
map <space>c :Unite change<CR>
map <space>g :Unite grep:
map <space>G :Unite grep:%<CR>
map <space>f :Unite vimgrep:
map <space>G :Unite vimgrep:%<CR>
map <space>m :Unite mru<CR>
map <space>hc :Unite history/command<CR>
map <space>hs :Unite history/search<CR>
map <space>hy :Unite history/yank<CR>
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
if neobundle#tap('unite.vim')
  function! neobundle#hooks.on_source(bundle)
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

          imap <silent><buffer> <c-q> <Plug>(unite_exit)
          nmap <silent><buffer> <c-q> <Plug>(unite_exit)
          nmap <silent><buffer> <ESC> <Plug>(unite_exit)
          nunmap <silent><buffer> <C-l>
          nmap <silent><buffer> R <Plug>(unite_redraw)
      endfunction
      """"""""""""""""""""""""""""""
      let g:unite_source_history_yank_enable = 1
      let g:unite_source_grep_max_candidates = 0
      let g:unite_source_find_max_candidates = 0
      call unite#custom_max_candidates('vimgrep', 0)

      let ag_ignore = ['.hg', '.svn', '.git', '.bzr', '.ropeproject', 'node_modules', 'bower_components']

      if executable('ag')
          " Use ag in unite grep source.
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
  endfunction
  call neobundle#untap()
endif
