" PluginAdd 'kannokanno/previm'

if executable('yarn')
  PluginAdd 'iamcco/markdown-preview.nvim', #{on_updated: 'cd app & yarn install'}
  let g:mkdp_auto_close = 0
endif

if g:env#nvim
  PluginAdd 'ixru/nvim-markdown'
  let g:vim_markdown_no_default_key_mappings = 1
endif
