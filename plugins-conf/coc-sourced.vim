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
        \ "keyword": "",
        \ "variable": "",
        \ "value": "󰎠",
        \ "operator": "",
        \ "constructor": "󰆧",
        \ "function": "ƒ",
        \ "reference": "",
        \ "constant": "",
        \ "method": "",
        \ "struct": "",
        \ "class": "",
        \ "interface": "",
        \ "text": "󱀍",
        \ "enum": "",
        \ "enumMember": "",
        \ "module": "",
        \ "color": "",
        \ "property": "",
        \ "field": "",
        \ "unit": "",
        \ "event": "",
        \ "file": "",
        \ "folder": "",
        \ "snippet": "",
        \ "typeParameter": "",
        \ "default": ""
        \ }
  for [key, value] in items(labels)
    call coc#config('suggest.completionItemKindLabels.' . key, value)
  endfor
  call coc#config('explorer.icon.enableNerdfont', v:true)
endif
