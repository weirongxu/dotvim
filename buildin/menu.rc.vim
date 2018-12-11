let g:menus = {}
let g:filetype_menus = {
      \ '_': []
      \}

function! s:filetype_tool_set(type, command_candidates) "{{{
  if ! empty(a:command_candidates)
    let l:source_conf = get(g:filetype_menus, a:type, [])
    let g:filetype_menus[a:type] = l:source_conf + a:command_candidates
  endif
endfunction "}}}

function! MenuFileType(types, command_candidates) "{{{
  if type(a:types) == type('')
    call s:filetype_tool_set(a:types, a:command_candidates)
  elseif type(a:types) == type([])
    for l:type in a:types
      call s:filetype_tool_set(l:type, a:command_candidates)
    endfor
  endif
endfunction "}}}

function! MenuMiscAdd(command_candidates) "{{{
  if ! has_key(g:menus, 'misc')
    let g:menus.misc = {
          \  'description': 'Misc',
          \  'command_candidates': [],
          \ }
  endif
  call extend(g:menus.misc.command_candidates, a:command_candidates)
endfunction "}}}

function! MenuGroupAdd(group, desc, command_candidates) "{{{
  let g:menus[a:group] = {
        \  'description': a:desc,
        \  'command_candidates': a:command_candidates,
        \ }
endfunction "}}}
