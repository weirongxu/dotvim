PluginAdd 'ft-extend', {'inner': 1}
PluginAdd 'drmikehenry/vim-fixkey'
PluginAdd 'mhinz/vim-startify'
" set sessionoptions=blank,buffers,curdir,folds,help,resize,slash,tabpages,unix
set sessionoptions=curdir,folds,help,tabpages
let g:startify_session_dir = g:env#record_dir#sessions
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_custom_header = []
let g:startify_bookmarks = [
      \ $MYVIMRC,
      \ $MY_PLUGINS,
      \ ]
let g:startify_list_order = [
      \ ['   Vimfile:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Last Recently Use:'],
      \ 'files',
      \ ]
map <Leader><Leader><Leader> <Cmd>Startify<CR>
function! g:plugin_hooks[SourcedHook()]()
  call AddCommand('session.save', 'SSave')
  call AddCommand('session.load', 'SLoad')
  call AddCommand('session.delete', 'SDelete')
  call AddCommand('session.close', 'SClose')
endfunction

PluginAdd 'kshenoy/vim-signature'
let g:SignatureErrorIfNoAvailableMarks = 0

if !g:env#win
  PluginAdd 'gioele/vim-autoswap'
endif

PluginAdd 'tpope/vim-repeat'

PluginAdd 'andymass/vim-matchup'
let g:matchup_matchparen_deferred = 1

PluginAdd 'luochen1990/rainbow'
let g:rainbow_active = 0

PluginAdd 'AndrewRadev/splitjoin.vim', {'on_map': ['gS', 'gJ']}

PluginAdd 'thinca/vim-ref', { 'on_cmd': 'Ref', 'on_map': '<Plug>(ref-keyword)' }
let g:ref_phpmanual_path = expand('~/document/ref/php-chunked-xhtml/')
map <Leader>K <Plug>(ref-keyword)

PluginAdd 'matze/vim-move', { 'on_map': ['<M-k>', '<M-j>'] }
let g:move_key_modifier = 'M'
let g:move_auto_indent = 0
map <S-Up> <M-k>
map <S-Down> <M-j>

PluginAdd 'tpope/vim-characterize', {'on_map': 'ga'}

PluginAdd 'liuchengxu/vim-which-key', {'on_cmd': ['WhichKey', 'WhichKey!']}
nmap <silent> <Leader> <Cmd>WhichKey '<Leader>'<CR>
vmap <silent> <Leader> :<C-U>WhichKeyVisual '<Leader>'<CR>
nmap <silent> <Leader>kg <Cmd>WhichKey 'g'<CR>
vmap <silent> <Leader>kg :<C-U>WhichKeyVisual 'g'<CR>

" PluginAdd 'tweekmonster/braceless.vim'
" function! g:plugin_hooks[SourcedHook()]()
"   autocmd FileType python,haml,sass,slim,yaml,coffee BracelessEnable +indent
" endfunction

PluginAdd 'lambdalisue/readablefold.vim'

" PluginAdd 'Shougo/deol.nvim'

PluginAdd 'tpope/vim-unimpaired'
