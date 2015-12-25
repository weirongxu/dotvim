let g:quickrun_config = {}
if executable('babel')
  let g:quickrun_config['javascript'] = {
        \ 'type': 'javascript/babel'
        \ }
endif
let babel_loading = join([
      \ "module.paths.push('\\$(npm config get prefix)/lib/node_modules')",
      \ "require('babel-polyfill')",
      \ ], ';') . ';'
let g:quickrun_config['javascript/babel'] = {
      \ 'command': 'babel',
      \ 'cmdopt': '--experimental',
      \ 'exec': [
      \   '%c %s %o -o %s',
      \   'echo "' . babel_loading . '\$(cat %s)" | node',
      \ ],
      \ 'hook/sweep/files': ['%S'],
      \ }
