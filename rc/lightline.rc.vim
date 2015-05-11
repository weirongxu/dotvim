let g:lightline = {
      \   'colorscheme': 'jellybeans',
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['git_branch', 'git_traffic', 'git_status'],
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
      \     'ibus':       '%{exists("g:ibus#enabled")&&g:ibus#enabled?"汉":""}',
      \     'fixdir':     '%{fixdir#started()?"FD":""}',
      \     'virtualenv': '%{exists("*virtualenv#statusline")?"[".virtualenv#statusline()."]":""}',
      \   },
      \   'component_function': {
      \     'git_branch': 'g:lightline.my.git_branch',
      \     'git_traffic': 'g:lightline.my.git_traffic',
      \     'git_status': 'g:lightline.my.git_status',
      \   },
      \   'tab_component_function': {
      \     'ctrlspace_tabnum': 'g:lightline.my.CtrlspaceTabnum',
      \     'ctrlspace_filename': 'g:lightline.my.CtrlspaceTabtitle',
      \   },
      \   'subseparator': { 'left': "", 'right': "" },
      \ }

let g:lightline.my = {}

function! g:lightline.my.CtrlspaceTabnum(n) "{{{
  if exists('*ctrlspace#tab_buffers_number')
    return a:n . ctrlspace#tab_buffers_number(a:n)
  else
    return a:n
  endif
endfunction "}}}

" function! g:lightline.my.CtrlspaceTabtitle(n) "{{{
"   let t:ctrlspace_start_window = winnr()
"   return ctrlspace#tab_title(a:n, 0, 0)
" endfunction "}}}

function! g:lightline.my.git_branch() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('branch') : ''
endfunction " }}}
function! g:lightline.my.git_traffic() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('traffic') : ''
endfunction " }}}
function! g:lightline.my.git_status() " {{{
  return winwidth(0) > 70 ? gita#statusline#preset('status') : ''
endfunction " }}}
