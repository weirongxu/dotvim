PluginAdd 'majutsushi/tagbar', #{
      \ on_cmd: [
      \   'TagbarOpen',
      \   'TagbarClose',
      \   'TagbarToggle',
      \   'Tagbar',
      \   'TagbarOpenAutoClose',
      \   'TagbarTogglePause',
      \   'TagbarSetFoldlevel',
      \   'TagbarShowTag',
      \   'TagbarCurrentTag',
      \   'TagbarGetTypeConfig',
      \   'TagbarDebug',
      \   'TagbarDebugEnd',
      \ ]}
let g:tagbar_show_linenumbers = 1
map <Leader>tt <Cmd>TagbarToggle<CR>
Include /plugins-conf/tagbar.vim
Pkg npm install jsctags

PluginAdd 'liuchengxu/vista.vim'
map <Leader>tv <Cmd>Vista coc<CR>

PluginAdd 'wesleyche/SrcExpl', #{on_cmd: ['SrcExpl', 'SrcExplClose', 'SrcExplToggle']}

if g:env#nvim
  PluginAdd 'phaazon/hop.nvim', #{on_map: ['s']}
  nmap sw <Cmd>HopWordAC<CR>
  nmap se <Cmd>HopWordAC<CR>
  nmap sb <Cmd>HopWordBC<CR>
  nmap s/ <Cmd>HopPatternAC<CR>
  nmap s? <Cmd>HopPatternBC<CR>
  nmap sf <Cmd>HopChar1AC<CR>
  nmap sF <Cmd>HopChar1BC<CR>
  nmap s2f <Cmd>HopChar2AC<CR>
  nmap s2F <Cmd>HopChar2BC<CR>
  nmap sj <Cmd>HopLineStartAC<CR>
  nmap sk <Cmd>HopLineStartBC<CR>
  function! g:plugin_hooks[SourcedHook()]()
    lua require'hop'.setup { keys = 'asdfghjkl;qwertyuiopzxcvbnm' }
  endfunction
else
  PluginAdd 'easymotion/vim-easymotion', #{on_map: ['<Plug>(easymotion-', 's']}
  let g:EasyMotion_leader_key = 's'
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1
  " nmap sS <Plug>(easymotion-s2)
  " nmap t <Plug>(easymotion-t2)
  nmap sl <Plug>(easymotion-sl)

  PluginAdd 'haya14busa/incsearch-easymotion.vim'
  function! s:config_easyfuzzymotion(...) abort
    return extend(copy({
          \   'converters': [incsearch#config#fuzzy#converter()],
          \   'modules': [incsearch#config#easymotion#module()],
          \   'keymap': {"\<CR>": '<Over>(easymotion)'},
          \   'is_expr': 0,
          \   'is_stay': 1
          \ }), get(a:, 1, {}))
  endfunction
  noremap <silent><expr> s/ incsearch#go(<SID>config_easyfuzzymotion())
endif
