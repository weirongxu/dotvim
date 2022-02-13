PluginAdd 'kana/vim-textobj-user'
function! g:plugin_hooks[SourcedHook()]()
  call textobj#user#plugin('php', {
        \   'code': {
        \     'pattern': ['<?php\>', '?>'],
        \     'select-a': 'aP',
        \     'select-i': 'iP',
        \   },
        \ })
  call textobj#user#plugin('webscript', {
        \   'code': {
        \     'pattern': ['<?', '?>'],
        \     'select-a': 'a?',
        \     'select-i': 'i?',
        \   },
        \ })
endfunction

PluginAdd 'kana/vim-textobj-indent'
PluginAdd 'kana/vim-textobj-entire'
PluginAdd 'kana/vim-textobj-line'
PluginAdd 'rhysd/vim-textobj-continuous-line'
PluginAdd 'mattn/vim-textobj-url'

PluginAdd 'coderifous/textobj-word-column.vim'
let g:skip_default_textobj_word_column_mappings = 1
xnoremap <silent> a<space>w :<C-u>call TextObjWordBasedColumn("aw")<cr>
xnoremap <silent> a<space>W :<C-u>call TextObjWordBasedColumn("aW")<cr>
xnoremap <silent> i<space>w :<C-u>call TextObjWordBasedColumn("iw")<cr>
xnoremap <silent> i<space>W :<C-u>call TextObjWordBasedColumn("iW")<cr>
onoremap <silent> a<space>w :call TextObjWordBasedColumn("aw")<cr>
onoremap <silent> a<space>W :call TextObjWordBasedColumn("aW")<cr>
onoremap <silent> i<space>w :call TextObjWordBasedColumn("iw")<cr>
onoremap <silent> i<space>W :call TextObjWordBasedColumn("iW")<cr>

PluginAdd 'thinca/vim-textobj-between'
let g:textobj_between_no_default_key_mappings = 1
function! g:plugin_hooks[SourcedHook()]()
  xmap a<space>f <Plug>(textobj-between-a)
  xmap i<space>f <Plug>(textobj-between-i)
  omap a<space>f <Plug>(textobj-between-a)
  omap i<space>f <Plug>(textobj-between-i)
endfunction

PluginAdd 'kana/vim-textobj-lastpat'
PluginAdd 'kana/vim-textobj-syntax'
PluginAdd 'kana/vim-textobj-fold'
PluginAdd 'kana/vim-textobj-datetime'
" PluginAdd 'whatyouhide/vim-textobj-xmlattr'
PluginAdd 'inside/vim-textobj-jsxattr'

PluginAdd 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
  \ 'i(': 1, 'a(': 1,
  \ 'i[': 1, 'a[': 1,
  \ 'i{': 1, 'a{': 1,
  \ 'i<': 1, 'a<': 1,
  \ "i\'": 1, "a\'": 1,
  \ 'i"': 1, 'a"': 1,
  \ 'it': 1, 'at': 1,
  \ 'iu': 0, 'au': 0,
  \ 'ic': 0, 'ac': 0,
  \ 'il': 0,
  \ 'ii': 0,
  \ 'i,': 0, 'a,': 0,
  \ 'ix': 0, 'ax': 0,
  \ 'ip': 0,
  \ 'ie': 0,
  \ }
map <CR> <Plug>(expand_region_expand)
vmap <BS> <Plug>(expand_region_shrink)
function! g:plugin_hooks[SourcedHook()]()
  call expand_region#custom_text_objects('php', {
        \   'iP': 0, 'aP': 0,
        \ })
endfunction
