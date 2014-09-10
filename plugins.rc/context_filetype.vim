let g:context_filetype#filetypes = {
      \ 'coffee': [
      \   {
      \     'start':    '`',
      \     'end':      '`',
      \     'filetype': 'javascript',
      \   },
      \ ],
      \ 'markdown': [
      \   {
      \    'start' : '^\s*```\s*\(\h\w*\)',
      \    'end' : '^\s*```$',
      \     'filetype' : '\1',
      \   },
      \   {
      \    'start' : '^\s*```\s*viml',
      \    'end' : '^\s*```$',
      \     'filetype' : 'vim',
      \   },
      \ ],
      \ 'mkd': [
      \   {
      \     'start':    '^\s*```\s*\(\h\w*\)',
      \     'end':      '^\s*```$',
      \     'filetype': '\1',
      \   },
      \   {
      \    'start' : '^\s*```\s*viml',
      \    'end' : '^\s*```$',
      \     'filetype' : 'vim',
      \   },
      \ ],
      \ 'php': [
      \   {
      \     'start':    '<script>',
      \     'end':      '</script>',
      \     'filetype': 'javascript',
      \   },
      \   {
      \     'start':    '<script\%( [^>]*\)charset="[^\"]*"\%( [^>]*\)\?>',
      \     'end':      '</script>',
      \     'filetype': 'javascript',
      \   },
      \   {
      \     'start':    '<script\%( [^>]*\)\? type="text/javascript"\%( [^>]*\)\?>',
      \     'end':      '</script>',
      \     'filetype': 'javascript',
      \   },
      \   {
      \     'start':    '<script\%( [^>]*\)\? type="text/coffeescript"\%( [^>]*\)\?>',
      \     'end':      '</script>',
      \     'filetype': 'coffee',
      \   },
      \   {
      \     'start':    '<style\%( [^>]*\)\? type="text/css"\%( [^>]*\)\?>',
      \     'end':      '</style>',
      \     'filetype': 'css',
      \   },
      \ ],
      \}

let g:precious_enable_switchers = {
      \ "*" : {
      \   "setfiletype" : 1
      \ },
      \ "vim" : {
      \   "setfiletype" : 0
      \ },
      \ "jade" : {
      \   "setfiletype" : 0
      \ },
      \}
