PluginAdd 'thinca/vim-quickrun', {'on_cmd': 'QuickRun'}
map <c-q> <Cmd>QuickRun<CR>
let g:quickrun_config = {
  \  'scss': {
  \    'type': executable('node-sass') ? 'scss/nodejs':
  \            executable('scss') ? 'scss/ruby': '',
  \  },
  \  'scss/nodejs': {
  \    'command': 'node-sass',
  \    'cmdopt': '--output-style expanded',
  \    'exec': ['%c %o %s'],
  \    'tempfile': '%{tempname()}.scss',
  \    'outputter/buffer/filetype': 'css',
  \  },
  \  'scss/ruby': {
  \    'command': 'scss',
  \    'cmdopt': '--style expanded',
  \    'exec': ['%c %o %s'],
  \    'tempfile': '%{tempname()}.scss',
  \    'outputter/buffer/filetype': 'css',
  \  },
  \  'sass': {
  \    'type': executable('node-sass') ? 'sass/nodejs':
  \            executable('sass') ? 'sass/ruby': '',
  \  },
  \  'sass/nodejs': {
  \    'command': 'node-sass',
  \    'cmdopt': '--indented-syntax --output-style expanded',
  \    'exec': ['%c %o %s'],
  \    'tempfile': '%{tempname()}.sass',
  \    'outputter/buffer/filetype': 'css',
  \  },
  \  'sass/ruby': {
  \    'command': 'sass',
  \    'cmdopt': '--style expanded',
  \    'exec': ['%c %o %s'],
  \    'tempfile': '%{tempname()}.sass',
  \    'outputter/buffer/filetype': 'css',
  \  },
  \  'scss2sass': {
  \    'command': 'sass-convert',
  \    'cmdopt': '-F scss -T sass',
  \    'exec': ['%c %o %s'],
  \    'outputter/buffer/filetype': 'sass',
  \  },
  \  'sass2scss': {
  \    'command': 'sass-convert',
  \    'cmdopt': '-F sass -T scss',
  \    'exec': ['%c %o %s'],
  \    'outputter/buffer/filetype': 'scss',
  \  },
  \  'javascript.jsx': {
  \    'type': 'javascript',
  \  },
  \}

PluginAdd 'rhysd/reply.vim'

PluginAdd 'metakirby5/codi.vim', {'on_cmd': 'Codi'}
