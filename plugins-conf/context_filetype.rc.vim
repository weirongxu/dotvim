let g:context_filetype_common_config = {
      \ 'html': [
      \   {
      \     'start': '<script\%( [^>]*\)\? type="text\/coffeescript"\%( [^>]*\)\?>',
      \     'end': '</script>',
      \     'filetype': 'coffee',
      \   },
      \   {
      \     'start' : '<\%(style\|script\)\%( [^>]*\)\? type="text\/<syntax>"\%( [^>]*\)\?>',
      \     'end' : '</\%(style\|script\)>',
      \   },
      \   {
      \     'start' : '<\%(style\|script\)\%( [^>]*\)\? lang="sass"\%( [^>]*\)\?>',
      \     'end' : '</\%(style\|script\)>',
      \     'filetype': 'scss',
      \   },
      \   {
      \     'start' : '<\%(style\|script\)\%( [^>]*\)\? lang="sass?indentedSyntax"\%( [^>]*\)\?>',
      \     'end' : '</\%(style\|script\)>',
      \     'filetype': 'sass',
      \   },
      \   {
      \     'start' : '<\%(style\|script\)\%( [^>]*\)\? lang="<syntax>?\?\%([^>]*\)"\%( [^>]*\)\?>',
      \     'end' : '</\%(style\|script\)>',
      \   },
      \   {
      \     'start': '<script\%( [^>]*\)\?>',
      \     'end': '</script>',
      \     'filetype': 'javascript',
      \   },
      \ ],
      \ 'coffee': [
      \   {
      \     'start': '`',
      \     'end': '`',
      \     'filetype': 'javascript',
      \   },
      \ ],
      \ 'markdown': [
      \   {
      \     'start' : '^\s*```\s*<syntax>',
      \     'end' : '^\s*```$',
      \   },
      \   {
      \     'start' : '^\s*```\s*viml',
      \     'end' : '^\s*```$',
      \     'filetype' : 'vim',
      \   },
      \ ],
      \}

function! s:context_filetype_convert(config) "{{{
  let config = deepcopy(a:config)
  for match_list in values(config)
    for match_config in match_list
      if stridx(match_config['start'], '<syntax>') >= 0 || stridx(match_config['end'], '<syntax>') >= 0
        let match_config['filetype'] = '\1'
        let match_config['start'] = substitute(match_config['start'], '<syntax>', '\\(\\h\\w*\\)', '')
        let match_config['end'] = substitute(match_config['end'], '<syntax>', '\\(\\h\\w*\\)', '')
      endif
    endfor
  endfor
  return config
endfunction "}}}

let g:context_filetype#filetypes = s:context_filetype_convert(g:context_filetype_common_config)
for ft in g:env#html_type_list
  if has_key(g:context_filetype#filetypes, ft)
    let g:context_filetype#filetypes[ft] = extend(g:context_filetype#filetypes[ft], g:context_filetype#filetypes['html'])
  else
    let g:context_filetype#filetypes[ft] = g:context_filetype#filetypes['html']
  endif
endfor

let g:context_filetype#search_offset = 1000

" let g:regionsyntax_map = g:context_filetype_common_config

let g:context_filetype#same_filetypes = {
      \ 'c': 'cpp,d',
      \ 'cpp': 'c',
      \ 'zsh': 'sh',
      \}
