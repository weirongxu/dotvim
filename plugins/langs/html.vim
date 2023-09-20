" PluginAdd 'weirongxu/html5.vim'

PluginAdd 'mattn/emmet-vim', #{ on_map: ['<C-y>'], on_ft: g:env#web_assets_type_list }
let g:user_emmet_settings = {
\  'javascript': {
\     'extends': 'jsx',
\  },
\  'typescript': {
\     'extends': 'jsx',
\  },
\  'typescriptreact': {
\     'extends': 'jsx',
\  },
\  'typescript.tsx': {
\     'extends': 'jsx',
\  },
\}
