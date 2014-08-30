let g:context_filetype#filetypes = {
      \ 'coffee': [
      \   {
      \     'start' : '`',
      \     'end' : '`',
      \     'filetype' : 'javascript',
      \   },
      \ ],
      \ 'mkd': [
      \   {
      \    'start' : '^\s*```\s*\(\h\w*\)',
      \    'end' : '^\s*```$',
      \     'filetype' : '\1',
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
