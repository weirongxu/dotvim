let g:lightline = {
      \   'colorscheme': 'jellybeans',
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['fugitive'],
      \       ['virtualenv'],
      \       ['ibus'],
      \       ['readonly', 'filename', 'modified'],
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       ['percent'],
      \       ['fileformat', 'fileencoding', 'filetype'],
      \     ],
      \   },
      \   'inactive': {
      \     'left': [
      \       ['filename'],
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       ['percent'],
      \       ['absolutepath'],
      \     ],
      \   },
      \   'tab': {
      \     'active': [
      \       'ctrlspace_tabnum',
      \       'modified',
      \       'filename',
      \     ],
      \     'inactive': [
      \       'ctrlspace_tabnum',
      \       'modified',
      \       'filename',
      \     ],
      \   },
      \   'tabline': {
      \     'right': [ ['close'], ['fixdir'] ],
      \   },
      \   'component': {
      \     'fugitive':   '%{exists("*fugitive#head")?fugitive#head():""}',
      \     'ibus':       '%{g:ibus#enabled?"汉":""}',
      \     'fixdir':     '%{fixdir#started()?"FD":""}',
      \     'virtualenv': '%{exists("*virtualenv#statusline")?"[".virtualenv#statusline()."]":""}',
      \   },
      \   'tab_component_function': {
      \     'ctrlspace_tabnum': 'CtrlspaceTabnum',
      \     'ctrlspace_filename': 'CtrlspaceTabtitle',
      \   },
      \   'subseparator': { 'left': "", 'right': "" },
      \ }

function! CtrlspaceTabnum(n) "{{{
  return a:n . ctrlspace#tab_buffers_number(a:n)
endfunction "}}}

" function! CtrlspaceTabtitle(n) "{{{
"   let t:ctrlspace_start_window = winnr()
"   return ctrlspace#tab_title(a:n, 0, 0)
" endfunction "}}}
