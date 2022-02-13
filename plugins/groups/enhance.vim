PluginAdd 'ft-extend', {'inner': 1}
PluginAdd 'drmikehenry/vim-fixkey'
PluginAdd 'mhinz/vim-startify'
" set sessionoptions=blank,buffers,curdir,folds,help,resize,slash,tabpages,unix
set sessionoptions=curdir,folds,help,slash,tabpages,unix
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

PluginAdd 'tweekmonster/braceless.vim'
autocmd FileType python,haml,sass,slim,yaml,coffee BracelessEnable +indent

PluginAdd 'lambdalisue/readablefold.vim'

if !has('patch-8.1.0360')
  PluginAdd 'chrisbra/vim-diff-enhanced'
endif

" PluginAdd 'Shougo/deol.nvim'

PluginAdd 'tpope/vim-unimpaired'

if g:env#nvim
  PluginAdd 'gelguy/wilder.nvim'
  function! g:plugin_hooks[SourcedHook()]()
    call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<C-n>',
      \ 'previous_key': '<C-p>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })
    call wilder#set_option('pipeline', [
      \   wilder#branch(
      \     wilder#cmdline_pipeline({
      \       'fuzzy': 1,
      \       'set_pcre2_pattern': has('nvim'),
      \     }),
      \     wilder#python_search_pipeline({
      \       'pattern': 'fuzzy',
      \     }),
      \   ),
      \ ])
    let s:highlighters = [
      \ wilder#pcre2_highlighter(),
      \ wilder#basic_highlighter(),
      \ ]
    call wilder#set_option('renderer', wilder#renderer_mux({
      \ ':': wilder#popupmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ '/': wilder#wildmenu_renderer({
      \   'highlighter': s:highlighters,
      \ }),
      \ }))
  endfunction
endif
