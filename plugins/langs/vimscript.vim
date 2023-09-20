PluginAdd 'junegunn/vader.vim', #{
      \ on_cmd: 'Vader',
      \ on_ft: 'vader',
      \ }
PluginAdd 'thinca/vim-scall'
PluginAdd 'vim-jp/vital.vim'
PluginAdd 'vim-jp/vital-complete'
PluginAdd 'lambdalisue/vital-Whisky'
PluginAdd 'thinca/vim-themis', #{on_ft: ['vim', 'vimspec']}
PluginAdd 'lambdalisue/vim-backslash', #{on_ft: 'vim'}
PluginAdd 'tweekmonster/helpful.vim'
PluginAdd 'tpope/vim-scriptease'
PluginAdd 'tweekmonster/exception.vim'
command! ExceptionTrace call exception#trace()
PluginAdd 'tweekmonster/startuptime.vim'
" PluginAdd 'lifepillar/vim-colortemplate'
