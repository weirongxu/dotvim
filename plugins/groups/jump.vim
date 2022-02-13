PluginAdd 'majutsushi/tagbar', {
      \ 'on_cmd': [
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

PluginAdd 'wesleyche/SrcExpl', {'on_cmd': ['SrcExpl', 'SrcExplClose', 'SrcExplToggle']}

PluginAdd 'Lokaltog/vim-easymotion', {'on_map': ['<Plug>(easymotion-', 's']}
let g:EasyMotion_leader_key = 's'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" nmap sS <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
nmap sl <Plug>(easymotion-sl)
