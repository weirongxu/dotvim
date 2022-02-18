PluginAdd 'roxma/vim-tmux-clipboard'

" PluginAdd 'machakann/vim-highlightedyank'

if g:env#x && !has('nvim-0.5.0')
  PluginAdd 'haya14busa/vim-operator-flashy', {
        \ 'on_map': '<Plug>(operator-flashy)'
        \ }
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
else
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="HighlightText", timeout=400})
endif

PluginAdd 'MaxMEllon/vim-shiny'
" let g:vim_shiny_window_change = 1
nmap p  <Plug>(shiny-p)
nmap P  <Plug>(shiny-P)
nmap gp <Plug>(shiny-gp)
nmap gP <Plug>(shiny-gP)

PluginAdd 'ojroques/vim-oscyank'
autocmd TextYankPost *
      \ if v:event.operator is 'y' && v:event.regname is '+'
      \| OSCYankReg +
      \| endif
