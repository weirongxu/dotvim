"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYBUNDLEDIR.'/neobundle.vim'
endif

call neobundle#begin($MYBUNDLEDIR)
call neobundle#local($MYBUNDLEDIR.'-local', {})

NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#types#git#clone_depth = 1

function! s:rc(name) "{{{
  return $MYVIMFILES . '/rc/' . a:name . '.rc.vim'
endfunction "}}}

function! s:load_source(plugin_name, rc_name) "{{{
  let bundle = neobundle#get(a:plugin_name)
  if ! empty(bundle)
    let bundle.hooks.on_source = s:rc(a:rc_name)
  endif
endfunction "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vimscript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'junegunn/vader.vim', {
      \ 'on_cmd': 'Vader',
      \ 'on_ft': 'vader',
      \ }
NeoBundle 'thinca/vim-scall'
NeoBundle 'kana/vim-vspec'
NeoBundleLazy 'thinca/vim-prettyprint', {
      \ 'on_cmd': 'PP'
      \ }
NeoBundle 'vim-jp/vital.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mbbill/fencview'
NeoBundle 'LargeFile'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'nacitar/a.vim'
NeoBundle 'drmikehenry/vim-fixkey'
NeoBundle 'kshenoy/vim-signature'
let g:SignatureErrorIfNoAvailableMarks = 0
NeoBundle 'tpope/vim-repeat'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'editorconfig/editorconfig-vim', {'disabled': ! g:env#python}
call s:load_source('editorconfig-vim', 'editorconfig-vim')
NeoBundle 'Shougo/context_filetype.vim'
NeoBundle 'farseer90718/vim-regionsyntax'
" NeoBundle 'osyo-manga/vim-precious'
Include rc/context_filetype
NeoBundle 'itchyny/vim-cursorword'
NeoBundle 'bouzuya/vim-ibus'
Include rc/ibus
NeoBundle 'craigemery/vim-autotag'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO
" NeoBundle 'kana/vim-fakeclip'
" if !has('gui_running')
"   " Do not connect to X server.
"   set clipboard+=exclude:.*
"   " But I want to use clipboard!
"   let g:fakeclip_provide_clipboard_key_mappings = 1
" endif
" NeoBundle 'benmills/vimux'
" NeoBundle 'kana/vim-tabpagecd'
" NeoBundle 'zhaocai/GoldenView.Vim'
" let g:goldenview__enable_default_mapping = 0
"
" NeoBundle 'kana/vim-smartchr'
" inoremap <expr> - smartchr#one_of('->', '-')
" NeoBundle 'kana/vim-smartword', {
"       \ 'on_map': '<Plug>(smartword-'
"       \ }
" nmap w  <Plug>(smartword-w)
" nmap b  <Plug>(smartword-b)
" nmap e  <Plug>(smartword-e)
" nmap ge <Plug>(smartword-ge)
" vmap w  <Plug>(smartword-w)
" vmap b  <Plug>(smartword-b)
" vmap e  <Plug>(smartword-e)
" vmap ge <Plug>(smartword-ge)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Temp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'zefei/vim-colortuner'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'weirongxu/transformer.vim'
call s:load_source('transformer.vim', 'transformer')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mhinz/vim-startify'
set sessionoptions=blank,curdir,folds,help,resize,tabpages,unix
let g:startify_session_dir = $HOME.'/.record/vim-sessions'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_custom_header = [
    \ "Raidou's vim",
    \ ]
let g:startify_bookmarks = [
      \ $MYVIMRC,
      \ $MYPlugin,
      \ ]
let g:startify_list_order = [
      \ ['   Vimfile:'],
      \ 'bookmarks',
      \ ['   Sessions:'],
      \ 'sessions',
      \ ['   Last Recently Use:'],
      \ 'files',
      \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'kana/vim-textobj-user'
call s:load_source('vim-textobj-user', 'textobj-user')
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'rhysd/vim-textobj-continuous-line'
NeoBundle 'mattn/vim-textobj-url'
NeoBundle 'coderifous/textobj-word-column.vim'
NeoBundle 'thinca/vim-textobj-between'
NeoBundle 'sgur/vim-textobj-parameter'
NeoBundle 'kana/vim-textobj-lastpat'
NeoBundle 'kana/vim-textobj-syntax'
NeoBundle 'kana/vim-textobj-fold'
NeoBundle 'kana/vim-textobj-datetime'
NeoBundle 'whatyouhide/vim-textobj-xmlattr'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'i(': 1, 'a(': 1,
      \ 'i[': 1, 'a[': 1,
      \ 'i{': 1, 'a{': 1,
      \ 'i<': 1, 'a<': 1,
      \ 'i''': 1, 'a''': 1,
      \ 'i"': 1, 'a"': 1,
      \ 'it': 1, 'at': 1,
      \ 'iu': 0, 'au': 0,
      \ 'ic': 0, 'ac': 0,
      \ 'il': 0,
      \ 'ii': 0,
      \ 'i,': 0, 'a,': 0,
      \ 'ixa': 0, 'axa': 0,
      \ 'ip': 0,
      \ 'ie': 0,
      \ }
if neobundle#tap('vim-expand-region')
  function! neobundle#hooks.on_source(bundle)
    call expand_region#custom_text_objects('php', {
          \   'iP': 0, 'aP': 0,
          \ })
  endfunction
  if g:env#gui
    map <C-CR> <Plug>(expand_region_expand)
  else
    map <NL> <Plug>(expand_region_expand)
  endif
  vmap <BS> <Plug>(expand_region_shrink)

  call neobundle#untap()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'kana/vim-operator-user'
NeoBundle 'kana/vim-operator-replace'
map _ <Plug>(operator-replace)
NeoBundle 'rhysd/vim-operator-surround'
map sa <Plug>(operator-surround-append)
map sd <Plug>(operator-surround-delete)
map sr <Plug>(operator-surround-replace)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 1
let g:AutoPairsMapSpace = 0
let g:AutoPairs = {
      \ '(': ')',
      \ '[': ']',
      \ "'": "'",
      \ '"': '"',
      \ '`': '`',
      \ '{': '}'}
" NeoBundle 'kana/vim-smartinput'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'lambdalisue/vim-gita'
if neobundle#tap('vim-gita')
  command! Gstatus Gita status
  command! Gp Gita push
  command! Glp execute "Gita pull" | execute "Gita push"
  command! Gblp execute "Gita pull --rebase" | execute "Gita push"
  command! Gl Gita pull
  let g:gita#features#browse#extra_translation_patterns = {
        \ 'coding.net': [
        \   [
        \     '\vhttps?://git.coding\.net/(.{-})/(.{-})%(\.git)?$',
        \     '\vgit://git.coding\.net/(.{-})/(.{-})%(\.git)?$',
        \     '\vgit\@git.coding\.net:(.{-})/(.{-})%(\.git)?$',
        \     '\vssh://git\@git.coding\.net/(.{-})/(.{-})%(\.git)?$',
        \   ], {
        \     '_': 'https://coding.net/u/\1/p/\2/git/blob/%r1/%pt%{#L|}ls%{-}le',
        \     'blame': 'https://coding.net/u/\1/p/\2/git/blame/%r1/%pt%{#L|}ls%{-}le'
        \   },
        \ ],
        \ }
  call neobundle#untap()
endif
if g:env#unix
  NeoBundle 'airblade/vim-gitgutter'
  if neobundle#tap('vim-gitgutter')
    let g:gitgutter_enabled = 1
    let g:gitgutter_realtime = 0
    let g:gitgutter_eager = 0
    call neobundle#untap()
  endif
endif
NeoBundleLazy 'cohama/agit.vim', {
      \ 'on_cmd': ['Agit', 'AgitFile', 'AgitGit']
      \ }
" NeoBundle 'mhinz/vim-signify'
" NeoBundle 'rhysd/committia.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'on_cmd': [{ 'name': 'Unite',
      \               'complete': 'customlist,unite#complete_source'},
      \               'UniteWithCursorWord', 'UniteWithInput'],
      \ }
Include rc/unite

""""""""""""""""""""""""""""""
NeoBundle 'junkblocker/unite-tasklist'
command! TaskList Unite tasklist
command! TList Unite tasklist
""""""""""""""""""""""""""""""
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'Kocha/vim-unite-tig'
" NeoBundle 'supermomonga/unite-kawaii-calc'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/unite-help'
NeoBundle 'mattn/unite-gist'
" NeoBundle 'hewes/unite-gtags'
NeoBundle 'tsukkee/unite-tag'
if neobundle#tap('unite-tag')
  function! neobundle#hooks.on_source(bundle) "{{{
    let g:unite_source_tag_strict_truncate_string = 0
    autocmd BufEnter *
          \   if empty(&buftype)
          \|    nnoremap <buffer> <c-]> :<C-u>UniteWithCursorWord -wrap -auto-preview tag<CR>
          \|  endif
    set tags+=.tags,./.tags
  endfunction "}}}
  call neobundle#untap()
endif
NeoBundle 'farseer90718/unite-workflow'
if neobundle#tap('unite-workflow')
  function! s:unite_youdao(visual)
    if a:visual
      let reg = '"'
      let reg_save = getreg(reg)
      let reg_type = getregtype(reg)
      silent exe 'norm! gv"'.reg.'y'
      let cont = getreg(reg)
      call setreg(reg,reg_save,reg_type)
    else
      let cont = expand('<cword>')
    endif
    exec ":Unite -wipe youdao:".escape(cont, ' :\')
  endfunction
  nnoremap <space>yd :<C-u>call <SID>unite_youdao(0)<CR>
  vnoremap <space>yd :<C-u>call <SID>unite_youdao(1)<CR>
  call neobundle#untap()
endif
NeoBundle 'osyo-manga/unite-quickfix'
if neobundle#tap('unite-quickfix')
  function! neobundle#hooks.on_source(bundle) "{{{
    autocmd FileType qf q | Unite quickfix
  endfunction "}}}
  call neobundle#untap()
endif
" NeoBundle 'Shougo/neossh.vim'
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'Rykka/trans.vim', {
"       \ 'on_map': '<leader>t'
"       \ }
" call s:load_source('trans.vim', 'trans')
""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn|ropeproject)|(node_modules|bower_components|vendor))$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
" if !g:env#gui && !g:env#win
"   set rtp+=~/.fzf
"   NeoBundle 'junegunn/fzf', {
"         \ 'on_cmd': 'FZF',
"         \ 'base': '~/.fzf',
"         \ 'build': 'yes | ./install',
"         \ }
"   " map <c-p> :FZF<CR>
"   nnoremap <silent> <c-p>p :call fzf#run({ 'options': '-m', 'sink': 'edit' })<CR>
"   nnoremap <silent> <c-p>s :call fzf#run({ 'options': '-m', 'tmux_height': '40%', 'sink': 'split' })<CR>
"   nnoremap <silent> <c-p>t :call fzf#run({ 'options': '-m', 'sink': 'tabedit' })<CR>
"   nnoremap <silent> <c-p>v :call fzf#run({ 'options': '-m', 'sink': 'vertical split' })<CR>
"   let g:loaded_ctrlp = 1
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \     'windows': 'make -f make_mingw32.mak',
      \     'cygwin': 'make -f make_cygwin.mak',
      \     'mac': 'make -f make_mac.mak',
      \     'unix': 'make -f make_unix.mak',
      \    },
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'on_cmd': [
      \   { 'name': 'VimFiler',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerTab',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerExplorer',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'Edit',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'Write',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerCreate',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerSimple',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerSplit',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerDouble',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerCurrentDir',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerBufferDir',
      \     'complete': 'customlist,vimfiler#complete' },
      \   { 'name': 'VimFilerExplorer',
      \     'complete': 'customlist,vimfiler#complete' },
      \   'Read', 'Source',
      \ ],
      \ 'on_map': ['gn', 'gp'],
      \ }
call s:load_source('vimfiler.vim', 'vimfiler')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'tyru/caw.vim', {
      \ 'on_map': [['nxo',
      \   '<Plug>(caw:prefix)', '<Plug>(caw:i:toggle)', 'gc']],
      \ 'depends': 'Shougo/context_filetype.vim'
      \ }
if neobundle#tap('caw.vim')
  let g:caw_a_sp_left = '  '
  let s:caw_oneline_comment = {
        \ 'less': '//',
        \ 'jade': '//-',
        \ 'vader': '#',
        \ }
  let s:caw_wrap_oneline_comment = {
        \ 'css': ['/*', '*/'],
        \ 'less': ['/*', '*/'],
        \ 'htmlyiiprado': ['<!---', '--->'],
        \ 'blade': ['{{--', '--}}'],
        \ }
  function! neobundle#hooks.on_source(bundle)
    function! s:caw_filetype_changed() "{{{
      if exists('*context_filetype#get_filetype')
        let filetype = context_filetype#get_filetype()
      else
        let filetype = &filetype
      endif
      if has_key(s:caw_oneline_comment, filetype)
        let b:caw_oneline_comment = s:caw_oneline_comment[filetype]
      else
        let b:caw_oneline_comment = ''
      endif
      if has_key(s:caw_wrap_oneline_comment, filetype)
        let b:caw_wrap_oneline_comment = s:caw_wrap_oneline_comment[filetype]
      else
        let b:caw_wrap_oneline_comment = []
      endif
    endfunction "}}}
    autocmd CursorMoved * call s:caw_filetype_changed()
  endfunction
  call neobundle#untap()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Include rc/lightline
NeoBundle 'itchyny/lightline.vim'
call s:load_source('lightline.vim', 'lightline')
NeoBundle 'gcavallanti/vim-noscrollbar'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_conceallevel = 1
let g:indentLine_concealcursor = ''
let g:indentLine_fileTypeExclude = ['', 'stylus', 'jade', 'vimfiler', 'unite', 'tagbar', 'yaml']
let g:indentLine_faster = 1 " XXX Exists bug with jade and stylus syntax and vimfiler
if !g:env#x
  let g:indentLine_color_term = 8
endif
" NeoBundleLazy 'nathanaelkane/vim-indent-guides', {
"       \ 'on_cmd': ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
"       \ 'on_map': ['<Plug>IndentGuidesToggle', '<Plug>IndentGuidesEnable', '<Plug>IndentGuidesDisable'],
"       \ 'gui': 1
"       \ }
" let g:indent_guides_guide_size = 1
" nmap <silent> gL <Plug>IndentGuidesToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Rykka/colorv.vim'
let g:colorv_preview_ftype = join(g:env#web_assets_type_list, ',')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neocomplete.vim'
Include rc/neocomplete
NeoBundle 'hrsh7th/vim-neco-calc'
" NeoBundle 'Valloric/YouCompleteMe', {
"       \ 'build': {
"       \   'mac': './install.py',
"       \   'unix': './install.py',
"       \   'windows': 'install.py',
"       \   'cygwin': './install.py',
"       \ },
"       \ }
" let g:ycm_key_list_select_completion = ['<Down>']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'marijnh/tern_for_vim', {
      \ 'disabled': ! g:env#unix,
      \ 'on_ft': 'javascript',
      \ 'build': {
      \   'others': 'npm install',
      \ },
      \ }
call UniteFileTypeTool('javascript', [
      \ ['tern-doc', 'TernDoc'],
      \ ['tern-doc-browse', 'TernDocBrowse'],
      \ ['tern-type', 'TernType'],
      \ ['tern-def', 'TernDef'],
      \ ['tern-def-preview', 'TernDefPreview'],
      \ ['tern-def-split', 'TernDefSplit'],
      \ ['tern-def-tab', 'TernDefTab'],
      \ ['tern-refs', 'TernRefs'],
      \ ['tern-rename', 'TernRename'],
      \ ])
" NeoBundleLazy 'aereal/jscomplete-vim', {
"       \ 'on_ft': 'javascript'
"       \ }
" NeoBundleLazy 'myhere/vim-nodejs-complete', {
"       \ 'on_ft': 'javascript'
"       \ }
" let g:nodejs_complete_config = {
"       \  'js_compl_fn': 'jscomplete#CompleteJS',
"       \  'max_node_compl_len': 15,
"       \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'osyo-manga/vim-monster', {
      \ 'on_ft': 'ruby',
      \ }
let g:neocomplete#force_omni_input_patterns.ruby =
      \ '[^. *\t]\.\w*\|\h\w*::'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'davidhalter/jedi-vim', {
      \  'on_ft': 'python'
      \ }
let g:jedi#auto_initialization = 0
let g:jedi#show_call_signatures = 0
autocmd FileType python setlocal omnifunc=jedi#completions
let g:neocomplete#force_omni_input_patterns.python =
      \ '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import\s\(\w*,\s\)\?\|^\s*from \|^\s*import \)\w*'
call UniteFileTypeTool('python', [
      \ ['jedi-goto', 'call jedi#goto()'],
      \ ['jedi-goto_assignments', 'call jedi#goto_assignments()'],
      \ ['jedi-goto_definitions', 'call jedi#goto_definitions()'],
      \ ['jedi-usages', 'call jedi#usages()'],
      \ ['jedi-rename', 'call jedi#rename()'],
      \ ['jedi-rename_visual', 'call jedi#rename_visual()'],
      \ ['jedi-document', 'call jedi#show_documentation()'],
      \ ])


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'osyo-manga/vim-marching', {
      \  'on_ft': ['cpp', 'c']
      \ }
let g:marching_clang_command = "/usr/bin/clang"
let g:marching_include_paths = [
\   "/usr/include"
\]

if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#force_omni_input_patterns.c =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.cpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
let g:neocomplete#force_omni_input_patterns.objc =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
let g:neocomplete#force_omni_input_patterns.objcpp =
      \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'

let g:marching_enable_neocomplete = 1

" if g:env#unix && executable('clang')
"   NeoBundleLazy 'Rip-Rip/clang_complete', {
"         \  'on_ft': ['cpp', 'c']
"         \ }
"   " let g:clang_complete_copen = 1
"   let g:clang_complete_auto = 0
"   let g:clang_auto_select = 0
"   let g:clang_use_library = 1
"   let g:clang_library_path = '/usr/lib/'
"   let g:neocomplete#force_omni_input_patterns.c =
"         \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"   let g:neocomplete#force_omni_input_patterns.cpp =
"         \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"   let g:neocomplete#force_omni_input_patterns.objc =
"         \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
"   let g:neocomplete#force_omni_input_patterns.objcpp =
"         \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
"   let g:neocomplete#sources#omni#functions.c = 'ClangComplete'
"   let g:neocomplete#sources#omni#functions.cpp = 'ClangComplete'
"   let g:neocomplete#sources#omni#functions.objc = 'ClangComplete'
"   let g:neocomplete#sources#omni#functions.objcpp = 'ClangComplete'
" else
"     NeoBundleLazy 'Rip-Rip/clang_complete'
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'artur-shaik/vim-javacomplete2', {
"       \  'on_ft': 'java'
"       \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neosnippet.vim'
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
imap <expr><C-j> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: "\<C-j>"
imap <expr><C-CR> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)"
      \: "\<C-CR>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)"
      \: "\<TAB>"
smap <expr><C-j> neosnippet#jumpable() ?
      \ "\<Plug>(neosnippet_jump)"
      \: "\<C-j>"
smap <expr><C-CR> neosnippet#expandable() ?
      \ "\<Plug>(neosnippet_expand)"
      \: "\<C-CR>"
let g:neosnippet#snippets_directory = $MYVIMFILES.'/snippets'
let g:neosnippet#disable_runtime_snippets = {
      \   '_': 1
      \ }
set clipboard-=autoselect " 取消在选择模式移动时复制内容
" 快速编辑snip
command! Snip NeoSnippetEdit -split -vertical


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'osyo-manga/vim-watchdogs'
" NeoBundle 'jceb/vim-hier'
" NeoBundle 'dannyob/quickfixstatus'
" let g:watchdogs_check_BufWritePost_enable = 1

NeoBundle 'scrooloose/syntastic'
call s:load_source('syntastic', 'syntastic')


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'sheerun/vim-polyglot'
let g:polyglot_disabled = ['coffee', 'javascript']
NeoBundleLazy 'othree/yajs.vim', {
      \   'on_ft': 'javascript',
      \ }
NeoBundleLazy 'othree/es.next.syntax.vim', {
      \   'on_ft': 'javascript',
      \ }
NeoBundleLazy 'weirongxu/vim-coffee-script', {
      \   'on_ft': ['coffee', 'jade'],
      \ }
" NeoBundleLazy 'rcmdnk/vim-markdown', {
"       \ 'on_ft': 'markdown'
"       \ }
" let g:vim_markdown_initial_foldlevel=99
" NeoBundleLazy 'elzr/vim-json', {
"       \  'on_ft': 'json'
"       \ }
" NeoBundleLazy '2072/PHP-Indenting-for-VIm', {
"       \ 'on_ft': g:env#html_type_list
"       \ }
" NeoBundleLazy 'hdima/python-syntax', {
"       \  'on_ft': 'python'
"       \ }
" NeoBundleLazy 'hynek/vim-python-pep8-indent', {
"       \  'on_ft': 'python'
"       \ }
" NeoBundleLazy 'pangloss/vim-javascript', {
"       \ 'on_ft': 'javascript',
"       \ }
" let g:javascript_enable_domhtmlcss = 1

NeoBundleLazy 'othree/javascript-libraries-syntax.vim', {
      \  'on_ft': ['javascript'],
      \ }
let g:used_javascript_libs = 'jquery,underscore,backbone,angularjs,angularui,angularuirouter,react,flux,requirejs,jasmine,chai,handlebars'
NeoBundleLazy 'justinmk/vim-syntax-extra', {
      \ 'on_ft': ['c', 'cpp', 'lex', 'yacc']
      \ }
NeoBundleLazy 'jrestrepo/matlab', {
      \  'on_ft': 'matlab'
      \ }
NeoBundleLazy 'vim-scripts/autohotkey-ahk', {
      \  'on_ft': 'autohotkey'
      \ }
NeoBundleLazy 'gabesoft/vim-java', {
      \  'on_ft': 'java'
      \ }
NeoBundleLazy 'weirongxu/yiiprado.vim', {
      \  'on_ft': 'yiiprado'
      \ }
autocmd BufNewFile,BufRead *.tpl setfiletype yiiprado

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gregsexton/MatchTag', {
      \ 'on_ft': g:env#html_type_list
      \ }
NeoBundleLazy 'gcmt/breeze.vim', {
      \ 'on_ft': g:env#html_type_list
      \ }
NeoBundleLazy 'vim-scripts/matchit.zip', {
      \ 'on_ft': g:env#html_type_list
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TOOLS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'kannokanno/previm', {
      \ 'on_ft': ['markdown', 'rst'],
      \ 'depends': 'tyru/open-browser.vim',
      \ }
NeoBundleLazy 'Chiel92/vim-autoformat', {
      \ 'on_cmd': [
      \   { 'name': 'Autoformat',
      \     'complete': 'filetype' },
      \ ]}
NeoBundleLazy 'mattn/emmet-vim', {
      \ 'on_map': [['i', '<c-y>']],
      \ 'on_ft': g:env#web_assets_type_list,
      \ }
let g:emmet_html5 = 0
NeoBundle 'maksimr/vim-jsbeautify'
call UniteFileTypeTool(g:env#web_assets_type_list, [
      \ ['jsbf-RangeJsBeautify', 'call RangeJsBeautify()'],
      \ ['jsbf-JsBeautify', 'call JsBeautify()'],
      \ ['jsbf-JsxBeautify', 'call JsxBeautify()'],
      \ ['jsbf-RangeJsxBeautify', 'call RangeJsxBeautify()'],
      \ ['jsbf-JsonBeautify', 'call JsonBeautify()'],
      \ ['jsbf-RangeJsonBeautify', 'call RangeJsonBeautify()'],
      \ ['jsbf-RangeHtmlBeautify', 'call RangeHtmlBeautify()'],
      \ ['jsbf-HtmlBeautify', 'call HtmlBeautify()'],
      \ ['jsbf-RangeCSSBeautify', 'call RangeCSSBeautify()'],
      \ ['jsbf-CSSBeautify', 'call CSSBeautify()'],
      \ ])
NeoBundleLazy 'stephpy/vim-phpdoc', {
      \ 'on_ft': g:env#html_type_list
      \ }
nnoremap <leader>8 :call PhpDocSingle()<CR>
vnoremap <leader>8 :call PhpDocRange()<CR>
" let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "Raidou <weirongxu.raidou@gmail.com> ".strftime("%Y-%m-%d")
" let g:pdv_cfg_Copyright = "20013-2013 ".g:pdv_cfg_Author
" let g:pdv_cfg_License = ""
NeoBundleLazy 'nicwest/QQ.vim', {
      \ 'on_map': ['QQ', 'QH', 'QCO', 'QCC', 'QCN', 'QG']
      \ }
NeoBundleLazy 'januswel/sweepbuf.vim', {
      \ 'on_cmd': 'SweepBuffers'
      \}
NeoBundleLazy 'szw/vim-maximizer', {
      \ 'on_cmd': 'MaximizerToggle'
      \ }
map <space>a :MaximizerToggle<CR>
NeoBundleLazy 'rhysd/vim-grammarous', {
      \ 'on_cmd': [{ 'name': 'GrammarousCheck',
      \                 'complete': 'customlist,grammarous#complete_opt'}
      \ ]}
NeoBundleLazy 'salsifis/vim-transpose', {
      \   'on_cmd': [
      \     'Transpose', 'TransposeWords', 'TransposeTab', 'TransposeCSV',
      \   'TransposeInteractive', 'TransposeIndentToggle'
      \ ]}
NeoBundleLazy 'tpope/vim-characterize', {
      \ 'on_map': 'ga'
      \ }
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
      \ 'on_cmd': [{'name': 'VirtualEnvActivate',
      \                'complete': 'customlist,CompleteVirtualEnv' },
      \   'VirtualEnvDeactivate', 'VirtualEnvList'],
      \ }
function! CompleteVirtualEnv(arg_lead, cmd_line, cursor_pos)
    return virtualenv#names(a:arg_lead)
endfunction
let g:virtualenv_directory = '~/.virtualenv'
NeoBundleLazy 'weirongxu/fixdir.vim', {
      \ 'on_cmd': [{ 'name': 'FixDir',
      \                 'complete': 'customlist,fixdir#complete'}
      \ ]}
" NeoBundleLazy 'kana/vim-narrow', {
"       \ 'on_cmd': 'Narrow'
"       \ }
NeoBundleLazy 'Shougo/vinarise.vim', {
      \ 'on_cmd': ['Vinarise', 'VinariseScript2Hex', 'VinariseHex2Script',
      \               'VinarisePluginDump', 'VinarisePluginViewBitmapView']
      \ }
" NeoBundleLazy 'tyru/eskk.vim', {
"       \ 'on_cmd': '<Plug>(eskk:toggle)'
"       \ }
" imap <c-=> <Plug>(eskk:toggle)
NeoBundleLazy 'drmikehenry/vim-fontsize', {
      \ 'on_map': '<Plug>Fontsize'
      \ }
nmap <silent> <Leader>=           <Plug>FontsizeBegin
nmap <silent> <C-ScrollWheelUp>   <Plug>FontsizeInc
nmap <silent> <Leader>+           <Plug>FontsizeInc
nmap <silent> <C-ScrollWheelDown> <Plug>FontsizeDec
nmap <silent> <Leader>-           <Plug>FontsizeDec
nmap <silent> <Leader>0           <Plug>FontsizeDefault
NeoBundleLazy 'dhruvasagar/vim-table-mode', {
      \ 'on_map': '<Leader>tm'
      \ }
NeoBundleLazy 'jaxbot/semantic-highlight.vim', {
      \ 'on_cmd': 'SemanticHighlightToggle'
      \ }
nnoremap <Leader>s :SemanticHighlightToggle<cr>
NeoBundleLazy 'vim-scripts/DrawIt', {
      \ 'on_cmd': ['DIstart', 'DIsngl', 'DIdbl', 'DIstop', 'DrawIt'],
      \ 'on_map': ['<leader>di', '<leader>ds']
      \ }
NeoBundleLazy 'vim-scripts/VisIncr', {
      \ 'on_cmd': [
      \   'I', 'II', 'IB', 'IIB', 'IO', 'IIO',
      \   'IX', 'IIX', 'IYMD', 'IMDY', 'IDMY',
      \   'IA', 'ID', 'IM', 'IPOW', 'IIPOW'
      \ ]}
NeoBundleLazy 'tpope/vim-eunuch', {
      \ 'on_cmd': ['Unlink', 'Remove', 'Move',
      \               'Rename', 'Chmod', 'Find',
      \               'Locate', 'SudoWrite', 'W']
      \ }
NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'on_cmd': 'QuickRun'
      \ }
NeoBundleLazy 'weirongxu/quickrun-babel.vim', {
      \ 'on_ft': 'javascript',
      \ }
NeoBundleLazy 'joonty/vdebug', {
      \ 'on_cmd': ['VdebugEval', 'VdebugOpt', 'VdebugStart']
      \ }
NeoBundleLazy 'mattn/emoji-vim', {
      \ 'on_cmd': 'Emoji',
      \ 'type': 'nosync'
      \ }
NeoBundleLazy 'thinca/vim-ref', {
      \ 'on_cmd': 'Ref',
      \ 'on_map': '<Plug>(ref-keyword)'
      \ }
let g:ref_phpmanual_path = expand('~/document/ref/php-chunked-xhtml/')
map K <Plug>(ref-keyword)
" NeoBundleLazy 'tpope/vim-dispatch', {
"       \ 'on_cmd': ['Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start']
"       \ }
NeoBundleLazy 'justinmk/vim-gtfo', {
      \ 'on_map': ['got', 'goT', 'gof', 'goF']
      \ }
NeoBundleLazy 'wesleyche/SrcExpl', {
      \ 'on_cmd': ['SrcExpl', 'SrcExplClose', 'SrcExplToggle']
      \ }
" NeoBundleLazy 'joedicastro/DirDiff.vim', {
NeoBundleLazy 'zhaocai/DirDiff.vim', {
      \ 'on_cmd': [
      \   {'name': 'DirDiff', 'complete': 'dir'},
      \   'DirDiffOpen', 'DirDiffNext',
      \   'DirDiffPrev', 'DirDiffUpdate', 'DirDiffQuit'
      \ ]}
NeoBundleLazy 'matze/vim-move', {
      \ 'on_map': ['<M-k>', '<M-j>']
      \ }
let g:move_key_modifier = 'M'
let g:move_auto_indent = 0
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
      \ 'on_map': ['gS', 'gJ']
      \ }
NeoBundleLazy 'osyo-manga/vim-jplus', {
      \ 'on_map': '<Plug>(jplus'
      \ }
nmap J <Plug>(jplus)
vmap J <Plug>(jplus)
nmap <Leader>J <Plug>(jplus-getchar)
vmap <Leader>J <Plug>(jplus-getchar)
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/gist-vim', {
      \ 'on_cmd': 'Gist',
      \ 'on_func': 'gist#list'
      \ }
let g:gist_token_file = expand('~/.record/github-token')

NeoBundleLazy 'jaxbot/github-issues.vim', {
      \ 'on_cmd': ['Gissues', 'Giadd', 'Giedit', 'Giupdate', 'Gmiles']
      \ }
let github_token_file = g:gist_token_file
if filereadable(github_token_file)
  let g:github_access_token = strpart(join(readfile(github_token_file), ""), 6)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mbbill/undotree', {
      \ 'on_cmd': [
      \   'UndotreeToggle', 'UndotreeFocus', 'UndotreeShow', 'UndotreeHide'
      \ ]}
command! Undotree UndotreeToggle
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'on_cmd': [
      \   'GundoToggle', 'GundoHide', 'GundoRendGraph', 'GundoShow'
      \ ]}
command! Gundo GundoToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'junegunn/vim-easy-align', {
      \ 'on_map': ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
      \ 'on_cmd': ['EasyAlign', 'LiveEasyAlign']
      \ }
vmap <Enter> <Plug>(LiveEasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'on_cmd': ['TagbarOpen', 'TagbarClose', 'TagbarToggle', 'Tagbar',
      \               'TagbarOpenAutoClose', 'TagbarTogglePause',
      \               'TagbarSetFoldlevel', 'TagbarShowTag',
      \               'TagbarCurrentTag', 'TagbarGetTypeConfig',
      \               'TagbarDebug', 'TagbarDebugEnd']
      \ }
map gl :TagbarToggle<CR>
Include rc/tagbar
let g:tagbar_show_linenumbers = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mattn/vim-sunday', {
      \ 'on_map': ['<c-a>', '<c-x>']
      \ }
let g:sunday_pairs = [
    \   ['extends', 'implements'],
    \   ['require', 'require_once', 'include', 'include_once'],
    \   ['NeoBundle', 'NeoBundleLazy'],
    \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'itchyny/calendar.vim'
" let g:calendar_google_task = 1
NeoBundleLazy 'mattn/calendar-vim', {
      \ 'on_cmd': ['Calendar', 'CalendarH', 'CalendarT'],
      \ 'on_map': ['<LocalLeader>cal', '<LocalLeader>caL']
      \ }
map gC :Calendar<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vimshell.vim', {
      \ 'on_cmd': ['VimShell', 'VimShellCreate', 'VimShellTab', 'VimShellPop',
      \               'VimShellCurrentDir', 'VimShellBufferDir', 'VimShellExecute',
      \               'VimShellInteractive', 'VimShellTerminal', 'VimShellSendString',
      \               'VimShellSendBuffer']
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Lokaltog/vim-easymotion', {
      \ 'on_map': ['<Plug>(easymotion-', 's']
      \ }
if neobundle#tap('vim-easymotion')
  let g:EasyMotion_leader_key = 's'
  let g:EasyMotion_use_upper = 1
  let g:EasyMotion_smartcase = 1
  let g:EasyMotion_use_smartsign_us = 1
  " nmap sS <Plug>(easymotion-s2)
  " nmap t <Plug>(easymotion-t2)
  nmap sl <Plug>(easymotion-sl)
  call neobundle#untap()
endif
""""""""""""""""""""""""""""""
" NeoBundle 'junegunn/vim-pseudocl'
" NeoBundle 'junegunn/vim-oblique'
" let g:oblique#incsearch_highlight_all=1

""""""""""""""""""""""""""""""
NeoBundleLazy 'haya14busa/incsearch.vim', {
      \ 'on_map': ['/', '<Plug>(incsearch-']
      \ }
if neobundle#tap('incsearch.vim') "{{{
  function! neobundle#hooks.on_source(bundle)
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)
    let g:incsearch#highlight = {
          \   'on_cursor': {
          \     'priority': '100'
          \   },
          \   'cursor': {
          \     'group': 'ErrorMsg',
          \     'priority': '1000'
          \   }
          \ }
  endfunction
  call neobundle#untap()
endif "}}}

NeoBundleLazy 'osyo-manga/vim-over', {
      \ 'on_cmd': 'OverCommandLine'
      \ }

NeoBundle 'thinca/vim-visualstar'
NeoBundleLazy 'osyo-manga/vim-anzu', {
      \ 'on_map': '<Plug>(anzu-'
      \ }
if neobundle#tap('vim-anzu') "{{{
  nmap n <Plug>(anzu-n-with-echo)
  nmap N <Plug>(anzu-N-with-echo)
  call neobundle#untap()
endif "}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
" NeoBundle 'rbtnn/rabbit-ui.vim'
" NeoBundle 'itchyny/thumbnail.vim'
" NeoBundleLazy 't9md/vim-choosewin'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call neobundle#end()

" zeal
map <leader>z :call zeal#execute(context_filetype#get_filetype(), expand("<cword>"))<CR>
