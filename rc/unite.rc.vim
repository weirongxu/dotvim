nmap U :Unite
map <Leader>u :UniteResume<CR>
map <Leader>U :Unite history/command<CR>
map <space>b :Unite buffer<CR>
map <space>t :Unite tab<CR>
map <space>T :Unite tab:no-current<CR>
map <space>j :Unite jump<CR>
map <space>c :Unite change<CR>
map <space>g :Unite grep:
map <space>G :Unite grep:%<CR>
map <space>f :Unite vimgrep:
map <space>F :Unite vimgrep:%<CR>
map <space>hc :Unite history/command<CR>
map <space>hs :Unite history/search<CR>
map <space>hy :Unite history/yank<CR>

" config
let g:unite_source_grep_max_candidates = 0
let g:unite_source_find_max_candidates = 0
if neobundle#tap('unite.vim')
  function! neobundle#hooks.on_source(bundle) "{{{
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom_max_candidates('vimgrep', 0)
  endfunction "}}}
  call neobundle#untap()
endif
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

" source menu
map <space>u :Unite menu<CR>
map <space>ut :Unite menu:lang-tools<CR>
map <space>ug :Unite menu:git-commands<CR>
let s:unite_source_menu_menus = {
      \ 'common-tools': {
      \   'description': 'Common Tools',
      \   'command_candidates': [
      \     ['rand password to reg', "call setreg('\"', RandPasswordInput())"],
      \   ],
      \ },
      \ 'git-commands': {
      \   'description': 'Git Commands',
      \   'command_candidates': [
      \     ['git pull', 'Gita pull'],
      \     ['git pull --rebase', 'Gita pull --rebase'],
      \     ['git push width pull', 'execute "Gita pull" | execute "Gita push"'],
      \     ['git push width pull rebase', 'execute "Gita pull --rebase" | execute "Gita push"'],
      \     ['git push', 'Gita push'],
      \     ['git status', 'Gita status'],
      \   ],
      \ }
      \ }
let s:unite_filetype_tools = {}
function! UniteFileTypeTool(types, conf) "{{{
  if type(a:types) == type('')
    call s:unite_filetype_tool_set(a:types, a:conf)
  elseif type(a:types) == type([])
    for l:tp in a:types
      call s:unite_filetype_tool_set(l:tp, a:conf)
    endfor
  endif
endfunction "}}}

function! s:unite_filetype_tool_set(type, conf) "{{{
  if ! empty(a:conf)
    if ! has_key(s:unite_filetype_tools, a:type)
      if type(a:conf) == type([])
        let s:unite_filetype_tools[a:type] = []
      elseif type(a:conf) == type({})
        let s:unite_filetype_tools[a:type] = {}
      endif
    endif
    call extend(s:unite_filetype_tools[a:type], a:conf)
  endif
endfunction "}}}

function! s:unite_menu_init() "{{{
  if has_key(s:unite_filetype_tools, &filetype)
    call extend(g:unite_source_menu_menus, {
          \ 'lang-tools': {
          \   'description': 'Lang tools',
          \   'command_candidates': s:unite_filetype_tools[&filetype]
          \  }
          \ })
  endif
endfunction "}}}

let g:unite_source_menu_menus = {}
call extend(g:unite_source_menu_menus, s:unite_source_menu_menus)
autocmd BufEnter,FileType * call <SID>unite_menu_init()
