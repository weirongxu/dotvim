" PluginAdd 'kannokanno/previm'

if executable('yarn')
  PluginAdd 'iamcco/markdown-preview.nvim', #{on_updated: 'cd app & yarn install'}
  let g:mkdp_auto_close = 0
endif
