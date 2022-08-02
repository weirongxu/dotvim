if g:env#nvim
  call coc#config('Lua.diagnostics.globals', [
        \ 'vim',
        \ 'describe',
        \ 'it',
        \ 'before_each',
        \ 'after_each',
        \ 'teardown',
        \ 'pending',
        \ ])

  let lua_runtimes = {}
  let lua_runtimes[$VIMRUNTIME . '/lua/'] = v:true
  for p in nvim_list_runtime_paths()
    let lua_path = expand(p + "/lua/")
    if isdirectory(lua_path)
      let lua_runtimes[lua_path] = v:true
    endif
  endfor
  call coc#config('Lua.workspace.library', lua_runtimes)
endif

if g:env#nerdfont
  let labels = {
        \ "keyword": "\uf1de",
        \ "variable": "\ue79b",
        \ "value": "\uf89f",
        \ "operator": "\u03a8",
        \ "constructor": "\uf0ad",
        \ "function": "\u0192",
        \ "reference": "\ufa46",
        \ "constant": "\uf8fe",
        \ "method": "\uf09a",
        \ "struct": "\ufb44",
        \ "class": "\uf0e8",
        \ "interface": "\uf417",
        \ "text": "\ue612",
        \ "enum": "\uf435",
        \ "enumMember": "\uf02b",
        \ "module": "\uf40d",
        \ "color": "\ue22b",
        \ "property": "\ue624",
        \ "field": "\uf9be",
        \ "unit": "\uf475",
        \ "event": "\ufacd",
        \ "file": "\uf723",
        \ "folder": "\uf114",
        \ "snippet": "\ue60b",
        \ "typeParameter": "\uf728",
        \ "default": "\uf29c"
        \ }
  for [key, value] in items(labels)
    call coc#config('suggest.completionItemKindLabels.' . key, value)
  endfor
  call coc#config('explorer.icon.enableNerdfont', v:true)
endif
