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
      \     ['git push with pull', 'execute "Gita pull" | execute "Gita push"'],
      \     ['git push with pull rebase', 'execute "Gita pull --rebase" | execute "Gita push"'],
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
