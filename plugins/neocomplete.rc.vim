" neocomplete
let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_auto_select = 1
" let g:neocomplete#disable_auto_complete = 1
let g:neocomplete#sources#dictionary#dictionaries = {
      \ 'default' : '',
      \ 'css' : $MYVIMFILES.'/bundle-local/my-local/dict/cssColorName.dict',
      \ 'less' : $MYVIMFILES.'/bundle-local/my-local/dict/cssColorName.dict',
      \ 'javascript' : $MYVIMFILES.'/bundle-local/my-local/dict/javascript.dict',
      \ 'coffee' : $MYVIMFILES.'/bundle-local/my-local/dict/javascript.dict',
      \ }
let g:neocomplete#same_filetypes = {
      \ 'c': 'cpp',
      \ 'cpp': 'c',
      \ 'zsh': 'sh'
      \ }
" \ 'html': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'xhtml': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'jsp': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'php': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'jade': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'css': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'javascript': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'coffee': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',
" \ 'stylus': 'html,xhtml,jsp,php,jade,css,javascript,coffee,stylus',

" if g:env#win && g:env#gui
"   let g:neocomplete#use_vimproc = 0
" endif

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

let g:neocomplete#force_overwrite_completefunc = 1

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

if !exists('g:neocomplete#sources#omni#functions')
  let g:neocomplete#sources#omni#functions = {}
endif
