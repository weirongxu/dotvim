" neocomplcache
let g:neocomplcache_enable_at_startup = 1
" let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_disable_auto_complete = 1
let g:neocomplcache_same_filetype_lists = {
      \ 'c': 'cpp,d',
      \ 'cpp': 'c',
      \ 'html': 'css,javascript,coffee,stylus',
      \ 'jade': 'html',
      \ 'php': 'html',
      \ 'xhtml': 'html',
      \ 'zsh': 'sh'
      \ }
let g:neocomplcache_filename_include_exts = {
      \ 'cpp': ['', 'h', 'hpp', 'hxx']
      \ }

" if g:env#win && g:env#gui
"   let g:neocomplete#use_vimproc = 0
" endif

" dict
let g:neocomplcache_dictionary_filetype_lists = {
      \ 'default' : '',
      \ 'css' : $MYVIMFILES.'/dict/cssColorName.dict',
      \ 'less' : $MYVIMFILES.'/dict/cssColorName.dict'
      \ }
