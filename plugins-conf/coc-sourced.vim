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
    let lua_path = expand(p + '/lua/')
    if isdirectory(lua_path)
      let lua_runtimes[lua_path] = v:true
    endif
  endfor
  call coc#config('Lua.workspace.library', lua_runtimes)
endif

if g:env#nerdfont
  let labels = #{
        \ keyword: "",
        \ variable: "",
        \ value: "󰎠",
        \ operator: "",
        \ constructor: "󰆧",
        \ function: "ƒ",
        \ reference: "",
        \ constant: "",
        \ method: "",
        \ struct: "",
        \ class: "",
        \ interface: "",
        \ text: "󱀍",
        \ enum: "",
        \ enumMember: "",
        \ module: "",
        \ color: "",
        \ property: "",
        \ field: "",
        \ unit: "",
        \ event: "",
        \ file: "",
        \ folder: "",
        \ snippet: "",
        \ typeParameter: "",
        \ default: ""
        \ }
  for [key, value] in items(labels)
    call coc#config('suggest.completionItemKindLabels.' . key, value)
  endfor
  call coc#config('explorer.icon.enableNerdfont', v:true)
endif

call coc#config('session.directory', g:env#record_dir#sessions)

" Rime
call coc#config('rime-ls.max_tokens', 1)
call coc#config('rime-ls.always_incomplete', v:true)
if g:env#nerdfont
  call coc#config('coc-rime-ls.statusBar', '')
endif

function! RimeToggle()
  let rime_enable = CocAction('runCommand', 'coc-rime-ls.toggle')
  if rime_enable
    inoremap <silent> <Space> <C-r>=RimeConfirm()<CR>
    echomsg 'Rime enable'
  else
    iunmap <silent><expr> <Space>
    echomsg 'Rime disable'
  endif
  return ''
endfunction

function! RimeConfirm()
  let result = CocAction('runCommand', 'coc-rime-ls.completion_with_first')
  if result is v:false
    return "\<Space>"
  endif
  return ''
endfunction

command! RimeToggle call RimeToggle()

nmap <C-t> :RimeToggle<CR>
imap <expr> <C-t> RimeToggle()
