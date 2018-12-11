let g:filetype_tools = {
      \ '_': []
      \}

function! FileTypeTool(types, conf) "{{{
  if type(a:types) == type('')
    call s:filetype_tool_set(a:types, a:conf)
  elseif type(a:types) == type([])
    for l:type in a:types
      call s:filetype_tool_set(l:type, a:conf)
    endfor
  endif
endfunction "}}}

function! s:filetype_tool_set(type, conf) "{{{
  if ! empty(a:conf)
    let l:source_conf = get(g:filetype_tools, a:type, [])
    let g:filetype_tools[a:type] = l:source_conf + a:conf
  endif
endfunction "}}}
