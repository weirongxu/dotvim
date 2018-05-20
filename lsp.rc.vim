if g:env#lsp
  Pkg npm install javascript-typescript-langserver
  Pkg npm install vue-language-server
  Pkg pip3 install typing
  Pkg gem install language_server

  let g:LanguageClient_serverCommands = {}

  function! s:add_lang(types, cmd) "{{{
    for type in a:types
      if executable(a:cmd[0])
        let g:LanguageClient_serverCommands[type] = a:cmd
      endif
    endfor
  endfunction "}}}

  function! LSP_support(type) "{{{
    return has_key(g:LanguageClient_serverCommands, a:type)
  endfunction "}}}

  " call s:add_lang(['c', 'cpp'], ['cquery', '--log-file=/tmp/cq.log'])
  call s:add_lang(['vue'], ['vls'])
  call s:add_lang(['rust'], ['rustup', 'run', 'stable', 'rls'])
  call s:add_lang(['javascript', 'javascript.jsx'], ['javascript-typescript-stdio'])
  " call s:add_lang(['ruby'], ['language_server-ruby'])
else
  function! LSP_support(type) "{{{
    return 0
  endfunction "}}}
endif
