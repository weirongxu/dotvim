""
" buffer search
PluginAdd 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
" map n  <Plug>(incsearch-nohl-n)
" map N  <Plug>(incsearch-nohl-N)
let g:incsearch#highlight = {
  \   'on_cursor': {
  \     'priority': '100'
  \   },
  \   'cursor': {
  \     'group': 'ErrorMsg',
  \     'priority': '1000'
  \   }
  \ }

PluginAdd 'haya14busa/incsearch-fuzzy.vim'
function! s:config_fuzzyall(...) abort
  return extend(copy({
  \   'converters': [
  \     incsearch#config#fuzzy#converter(),
  \     incsearch#config#fuzzyspell#converter()
  \   ],
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> z/ incsearch#go(<SID>config_fuzzyall())
noremap <silent><expr> z? incsearch#go(<SID>config_fuzzyall({'command': '?'}))
noremap <silent><expr> zg? incsearch#go(<SID>config_fuzzyall({'is_stay': 1}))

PluginAdd 'haya14busa/incsearch-easymotion.vim'
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzy#converter()],
    \   'modules': [incsearch#config#easymotion#module()],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> s/ incsearch#go(<SID>config_easyfuzzymotion())

PluginAdd 'haya14busa/vim-asterisk'
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
" let g:asterisk#keeppos = 1

PluginAdd 'osyo-manga/vim-anzu', {'on_map': '<Plug>(anzu-'}
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)

PluginAdd 'markonm/traces.vim'

PluginAdd 'brooth/far.vim'

""
" directory search
" if g:env#python
"   PluginAdd 'Yggdroot/LeaderF', {'on_updated': './install.sh'}
"   let g:Lf_ShortcutF = '<Plug>Lf_ShortcutP'
"   let g:Lf_ShortcutB = '<Plug>Lf_ShortcutB'
"   let g:Lf_CommandMap = {
"        \ '<C-L>': ['<C-Z>'],
"        \ '<F5>': ['<C-L>'],
"        \ '<Up>': ['<C-P>'],
"        \ '<Down>': ['<C-N>'],
"        \ }
"   function! Lf_ShortcutF()
"     let g:Lf_WorkingDirectory = getcwd()
"     Leaderf file
"   endfunction
"   map <C-P> <Cmd>call Lf_ShortcutF()<CR>
" endif
" PluginAdd 'mhinz/vim-grepper', {'on_cmd': 'Grepper'}
