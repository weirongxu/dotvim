PluginAdd 'ft-extend', #{inner: 1}
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
function! StartifyCustomSessionSave(bang, name, ...)
  call startify#session_save(a:bang, a:name . '.vim', a:000)
endfunction
function StartifyCustomSessionList(...)
  return map(call('startify#session_list', a:000), {key, value -> substitute(value, '\v\.vim$', '', '')})
endfunction
map <Leader><Leader><Leader> <Cmd>Startify<CR>
function! g:plugin_hooks[SourcedHook()]()
  call AddCommand('session.save', 'SSave')
  call AddCommand('session.load', 'SLoad')
  call AddCommand('session.delete', 'SDelete')
  call AddCommand('session.close', 'SClose')
  command! -nargs=? -bar -bang -complete=customlist,StartifyCustomSessionList SSave call StartifyCustomSessionSave(<bang>0, <f-args>)
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

PluginAdd 'AndrewRadev/splitjoin.vim', #{on_map: ['gS', 'gJ']}

PluginAdd 'thinca/vim-ref', #{on_cmd: 'Ref', on_map: '<Plug>(ref-keyword)'}
let g:ref_phpmanual_path = expand('~/document/ref/php-chunked-xhtml/')
map <Leader>K <Plug>(ref-keyword)

PluginAdd 'matze/vim-move'
let g:move_map_keys = 0
let g:move_auto_indent = 0

nmap <Leader>k <Plug>MoveLineUp
nmap <Leader>j <Plug>MoveLineDown
" nmap <Leader>h <Plug>MoveCharLeft
" nmap <Leader>l <Plug>MoveCharRight

vmap <Leader>k <Plug>MoveBlockUp
vmap <Leader>j <Plug>MoveBlockDown
" vmap <Leader>h <Plug>MoveBlockLeft
" vmap <Leader>l <Plug>MoveBlockRight

nmap <S-Up>    <Plug>MoveLineUp
nmap <S-Down>  <Plug>MoveLineDown
" nmap <S-Left>  <Plug>MoveCharLeft
" nmap <S-Right> <Plug>MoveCharRight

vmap <S-Up>    <Plug>MoveBlockUp
vmap <S-Down>  <Plug>MoveBlockDown
" vmap <S-Left>  <Plug>MoveBlockLeft
" vmap <S-Right> <Plug>MoveBlockRight

PluginAdd 'tpope/vim-characterize', #{on_map: 'ga'}

PluginAdd 'spinks/vim-leader-guide'
nnoremap <silent> <leader> <Cmd>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<C-u>LeaderGuideVisual '<Space>'<CR>
nnoremap <silent> <Leader>kg <Cmd>LeaderGuide 'g'<CR>
vnoremap <silent> <Leader>kg :<C-u>LeaderGuideVisual 'g'<CR>

" PluginAdd 'tweekmonster/braceless.vim'
" function! g:plugin_hooks[SourcedHook()]()
"   autocmd FileType python,haml,sass,slim,yaml,coffee BracelessEnable +indent
" endfunction

PluginAdd 'lambdalisue/readablefold.vim'

" PluginAdd 'Shougo/deol.nvim'

PluginAdd 'tpope/vim-unimpaired'

PluginAdd 'jiangmiao/auto-pairs'
let g:AutoPairsMapCR = 0
let g:AutoPairsMapSpace = 0
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsMoveCharacter = ''
let g:AutoPairsMultilineClose = 0
nmap <silent> <Leader>ap :call AutoPairsToggle()<CR>
