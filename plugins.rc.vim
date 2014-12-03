"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYBUNDLEDIR.'/neobundle.vim'
endif

call neobundle#begin($MYBUNDLEDIR)
call neobundle#local($MYBUNDLEDIR.'-common', {})

" if g:env#unix
  " call neobundle#local($MYBUNDLEDIR.'-unix', {})
" elseif g:env#win
  " call neobundle#local($MYBUNDLEDIR.'-win32', {})
" endif

NeoBundleFetch 'Shougo/neobundle.vim'
let g:neobundle#types#git#clone_depth = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mbbill/fencview'
NeoBundle 'LargeFile'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'nacitar/a.vim'
NeoBundle 'drmikehenry/vim-fixkey'
NeoBundle 'teranex/sessionman.vim'
set sessionoptions=curdir,folds,help,resize,tabpages,unix
let g:sessions_path = $HOME.'/.record/vim-sessions'
NeoBundle 'kshenoy/vim-signature'
let g:SignatureErrorIfNoAvailableMarks = 0
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'benatkin/vim-move-between-tabs' " map tN tP
" NeoBundle 'jrhorn424/vim-multiple-cursors'
" NeoBundle 'zhaocai/GoldenView.Vim'
" let g:goldenview__enable_default_mapping = 0
if g:env#python
  NeoBundle 'editorconfig/editorconfig-vim'
endif
if neobundle#tap('editorconfig-vim') "{{{
    let neobundle#hooks.on_source =
          \ '~/.vim/rc/editorconfig-vim.rc.vim'

    call neobundle#untap()
endif "}}}
NeoBundle 'farseer90718/vim-regionsyntax'
NeoBundle 'Shougo/context_filetype.vim'
" NeoBundle 'osyo-manga/vim-precious'
Include rc/context_filetype
NeoBundle 'bouzuya/vim-ibus'
Include rc/ibus
NeoBundle 'craigemery/vim-autotag'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FIXME
" NeoBundle 'kana/vim-fakeclip'
" if !has('gui_running')
"   " Do not connect to X server.
"   set clipboard+=exclude:.*
"   " But I want to use clipboard!
"   let g:fakeclip_provide_clipboard_key_mappings = 1
" endif
" NeoBundle 'benmills/vimux'
" NeoBundle 'farseer90718/vim-taskwarrior'
" NeoBundle 'kana/vim-tabpagecd'
" NeoBundle 'chikatoike/concealedyank.vim'
" NeoBundle 'thinca/vim-guicolorscheme'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Temp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Translate
" neobundle 'Rykka/trans.vim'
" NeoBundle 'bolasblack/gtrans.vim'
" NeoBundle 'jiazhoulvke/googletranslate'
" NeoBundle 'ianva/vim-youdao-translater'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NeoBundle 'spf13/PIV'
" NeoBundle 'arnaud-lb/vim-php-namespace'
NeoBundle 'weirongxu/transformer.vim'
if neobundle#tap('transformer.vim')
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/transformer.rc.vim'
  call neobundle#untap()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'szw/vim-ctrlspace', {
      \ 'commands': [
      \   'CtrlSpace', 'CtrlSpaceGoNext', 'CtrlSpaceGoPrevious',
      \   'CtrlSpaceTabLabel', 'CtrlSpaceClearTabLabel',
      \   'CtrlSpaceSaveWorkspace', 'CtrlSpaceLoadWorkspace',
      \   'CtrlSpaceNewWorkspace',
      \ ],
      \ 'functions': 'ctrlspace'
      \ }
if executable("ag")
  let g:ctrlspace_glob_command = 'ag -l --nocolor -g ""'
endif
map <Space><Space> :CtrlSpace<CR>
let g:ctrlspace_save_workspace_on_exit=1
let g:ctrlspace_use_tabline = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mhinz/vim-startify'
let g:startify_custom_header = [
      \ '  Raidou''s vim',
      \ '',
      \ ]
let g:startify_bookmarks = [ $MYVIMRC, $MYPlugin ]
" FIXME
      " \ ['   Current directory:'],
      " \ 'dir',
let g:startify_list_order = [
      \ ['   Vimfile:'],
      \ 'bookmarks',
      \ ['   Last Recently Use:'],
      \ 'files',
      \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'kana/vim-textobj-user'
if neobundle#tap('vim-textobj-user')
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/textobj-user.rc.vim'
  call neobundle#untap()
endif
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
NeoBundle 'akiyan/vim-textobj-xml-attribute'
NeoBundle 'rhysd/vim-textobj-anyblock'
" NeoBundle 'osyo-manga/vim-textobj-multiblock'
" omap aB <Plug>(textobj-multiblock-a)
" omap iB <Plug>(textobj-multiblock-i)
" xmap aB <Plug>(textobj-multiblock-a)
" xmap iB <Plug>(textobj-multiblock-i)
" NeoBundle 'thinca/vim-textobj-comment'
" let g:loaded_textobj_comment = 1
" call textobj#user#plugin('comment', {
" \      '-': {
" \        '*sfile*': expand('<sfile>:p'),
" \        'select-a': 'a/', '*select-a-function*': 'textobj#comment#select_a',
" \        'select-i': 'i/', '*select-i-function*': 'textobj#comment#select_i',
" \      }
" \    })


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'iw': 0,
      \ 'iW': 0,
      \ 'ib': 1, 'ab': 1,
      \ 'it': 1, 'at': 1,
      \ 'iu': 0, 'au': 0,
      \ 'ic': 0, 'ac': 0,
      \ 'il': 0,
      \ 'ii': 0,
      \ 'i,': 0, 'a,': 0,
      \ 'ixa': 0, 'axa': 0,
      \ 'iy': 0, 'ay': 0,
      \ 'ip': 0,
      \ 'ie': 0,
      \ }
if neobundle#tap('vim-expand-region')
  function! neobundle#hooks.on_source(bundle)
    call expand_region#custom_text_objects('php', {
          \   'iP' : 0, 'aP' : 0,
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
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {
      \ 'commands' : ['Gitv']
      \ }
if g:env#unix
  NeoBundle 'airblade/vim-gitgutter'
  let g:gitgutter_enabled = 1
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
endif
" NeoBundle 'mhinz/vim-signify'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/unite.vim', {
      \ 'commands' : [{ 'name' : 'Unite',
      \                 'complete' : 'customlist,unite#complete_source'},
      \                 'UniteWithCursorWord', 'UniteWithInput']
      \ }
if neobundle#tap('unite.vim')
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/unite.rc.vim'
  call neobundle#untap()
endif
""""""""""""""""""""""""""""""
NeoBundleLazy 'junkblocker/unite-tasklist'
command! TaskList Unite tasklist
command! TList Unite tasklist
""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neomru.vim'
let g:unite_source_alias_aliases = {
      \   'mru' : {
      \     'source': 'file_mru'
      \   },
      \ }
command! MRU :Unite mru
""""""""""""""""""""""""""""""
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/junkfile.vim'
NeoBundle 'Kocha/vim-unite-tig'
" NeoBundle 'supermomonga/unite-kawaii-calc'
NeoBundle 'thinca/vim-unite-history'
NeoBundle 'Shougo/unite-help'
NeoBundle 'mattn/unite-gist'
" NeoBundle 'hewes/unite-gtags'
NeoBundle 'tsukkee/unite-tag'
let g:unite_source_tag_strict_truncate_string = 0
autocmd BufEnter *
      \   if empty(&buftype)
      \|    nnoremap <buffer> <c-]> :<C-u>UniteWithCursorWord -auto-preview tag<CR>
      \|  endif
set tags+=.tags,./.tags
NeoBundle 'farseer90718/unite-workflow'
" NeoBundle 'xolox/vim-misc'
" NeoBundle 'xolox/vim-easytags'
" NeoBundle 'Shougo/neossh.vim' " toy
""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'ctrlpvim/ctrlp.vim'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/](\.(git|hg|svn|ropeproject)|(node_modules|bower_components))$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ }
if !g:env#gui && !g:env#win
  set rtp+=~/.fzf
  NeoBundle 'junegunn/fzf', {
        \ 'commands' : 'FZF',
        \ 'base' : '~/.fzf',
        \ 'build' : 'yes | ./install',
        \ }
  " map <c-p> :FZF<CR>
  nnoremap <silent> <c-p>p :call fzf#run({ 'options': '-m', 'sink': 'edit' })<CR>
  nnoremap <silent> <c-p>s :call fzf#run({ 'options': '-m', 'tmux_height': '40%', 'sink': 'split' })<CR>
  nnoremap <silent> <c-p>t :call fzf#run({ 'options': '-m', 'sink': 'tabedit' })<CR>
  nnoremap <silent> <c-p>v :call fzf#run({ 'options': '-m', 'sink': 'vertical split' })<CR>
  let g:loaded_ctrlp = 1
endif

NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'commands' : [
      \   { 'name' : 'VimFiler',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerTab',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerExplorer',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'Edit',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'Write',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerCreate',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerSimple',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerSplit',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerDouble',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerCurrentDir',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerBufferDir',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   { 'name' : 'VimFilerExplorer',
      \     'complete' : 'customlist,vimfiler#complete' },
      \   'Read', 'Source',
      \ ]}
Include rc/vimfiler
" scrooloose版本在win下切换磁盘会有问题
" NeoBundleLazy 'mixvin/nerdtree', {
" NeoBundleLazy 'scrooloose/nerdtree', {
"       \ 'commands' : ['NERDTree', 'NERDTreeFromBookmark',
"       \               'NERDTreeToggle', 'NERDTreeMirror',
"       \               'NERDTreeClose', 'NERDTreeFind',
"       \               'NERDTreeCWD']
"       \ }
" map gn :NERDTreeToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'tomtom/tcomment_vim'
let g:tcommentMaps = 0
map <leader>; :TComment<cr>
nmap <leader>: $v^:TCommentInline<cr>
vmap <leader>: :TCommentInline<cr>
map <Leader>' :TCommentRight<cr>
map <leader>" :TCommentBlock<cr>
      " \ 'less_block': '/* %s */',
let g:tcomment_types = {
      \ 'less': '// %s',
      \ 'less_inline': '/* %s */',
      \ 'htmlyiiprado': '<!--- %s --->',
      \ 'htmlyiiprado_inline': '<!-- %s -->',
      \ 'markdown': '<!-- %s -->',
      \ 'markdown_inline': '<!-- %s -->',
      \ 'blade.php': '<!-- %s -->',
      \ 'jade': '//- %s',
      \ 'jade_inline': '// %s',
      \ 'vader': '# %s',
      \ 'vader_inline': '# %s',
      \ }

" NeoBundle 'tpope/vim-commentary'
" NeoBundleLazy 'tyru/caw.vim', {
"       \ 'mappings' : [['nxo',
"       \   '<Plug>(caw:prefix)', '<Plug>(caw:i:toggle)', 'gc']]
"       \ }
" let g:caw_a_sp_left = ' '

" NerdCommenter
" NeoBundle 'scrooloose/nerdcommenter'
" let g:NERDSpaceDelims=1
" map <leader>; <leader>ci
" map <leader>: <leader>cm
" map <leader>' <leader>cA
" map <leader>" <leader>cs
" let g:NERDCustomDelimiters = {
"       \ 'htmlyiiprado': { 'left': '<!---', 'right': '--->', 'leftAlt': '<!--', 'rightAlt': '-->' },
"       \ 'blade.php': { 'left': '<!--', 'right': '-->', 'leftAlt': '<!--', 'rightAlt': '-->' },
"       \ 'less': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
"       \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Include rc/lightline
NeoBundle 'itchyny/lightline.vim'
set showtabline=2
" 显示换行和制表符
set list listchars=tab:\|\ ,trail:.


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_fileTypeExclude = ['', 'stylus', 'jade', 'vimfiler', 'unite', 'tagbar']
let g:indentLine_faster = 1 " XXX Exists bug with jade and stylus syntax and vimfiler
if !g:env#x
  let g:indentLine_color_term = 8
endif
" NeoBundleLazy 'nathanaelkane/vim-indent-guides', {
"       \ 'commands' : ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
"       \ 'mappings' : ['<Plug>IndentGuidesToggle', '<Plug>IndentGuidesEnable', '<Plug>IndentGuidesDisable'],
"       \ 'gui': 1
"       \ }
" let g:indent_guides_guide_size = 1
" nmap <silent> gL <Plug>IndentGuidesToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Rykka/colorv.vim'
let g:colorv_preview_ftype = 'css,html,php,jsp,aspvbs,mason,javascript,htm,less,stylus'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
  Include rc/neocomplete
  NeoBundleDisable 'Shougo/neocomplcache.vim'
else
  NeoBundle 'Shougo/neocomplcache.vim'
  Include rc/neocomplcache
  NeoBundleDisable 'Shougo/neocomplete.vim'
endif
NeoBundle 'hrsh7th/vim-neco-calc'


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
      \   '_' : 1
      \ }
set clipboard-=autoselect " 取消在选择模式移动时复制内容
" 快速编辑snip
command! Snip NeoSnippetEdit -split -vertical


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'jceb/vim-hier'
" NeoBundle 'dannyob/quickfixstatus'
" NeoBundle 'osyo-manga/vim-watchdogs'
" let g:watchdogs_check_BufWritePost_enable = 1

NeoBundle 'scrooloose/syntastic'
if g:env#win
  let g:syntastic_error_symbol = '>x'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
else
  let g:syntastic_error_symbol = ">\u2717"
  let g:syntastic_style_error_symbol = "S\u2717"
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
endif
let g:syntastic_php_checkers=['php']
let quiet_php_messages = [
      \ 'comment',
      \ ]
let g:syntastic_php_phpcs_quiet_messages = {
      \ "regex": '\V\('.join(quiet_php_messages, '\|').'\)',
      \ }
let g:syntastic_python_checkers = ['flake8']
let quiet_python_messages = [
      \ 'E501',
      \ 'E111',
      \ ]
let g:syntastic_python_flake8_quiet_messages = {
      \ "regex": '\V\('.join(quiet_python_messages, '\|').'\)',
      \ }
let quiet_coffee_messages = [
      \ 'indentation Expected',
      \ 'Line exceeds maximum',
      \ ]
let g:syntastic_coffee_coffeelint_quiet_messages = {
      \ "regex": '\V\('.join(quiet_coffee_messages).'\|\)',
      \ }
map <Leader><space> :up<CR>:SyntasticCheck<CR>
      " \ 'mode': 'active',
let g:syntastic_mode_map = {
      \   'mode': 'passive',
      \   'active_filetypes': [],
      \   'passive_filetypes': ['java', 'less']
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'python-rope/ropevim', {
"       \ 'filetypes' : 'python',
"       \ }
NeoBundleLazy 'klen/python-mode', 'develop', {
      \ 'filetypes' : 'python',
      \ }
if neobundle#tap('python-mode')
  let neobundle#hooks.on_source =
        \ '~/.vim/rc/pymode.rc.vim'
  call neobundle#untap()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy "chase/vim-ansible-yaml", {
      \ 'filetypes': ['yaml', 'ansible']
      \ }
NeoBundleLazy 'vim-scripts/matchit.zip', {
      \ 'filetypes' : ['html', 'jsp', 'xhtml', 'xml', 'htm', 'php', 'aspvbs', 'mason']
      \ }
NeoBundleLazy 'othree/html5.vim', {
      \ 'filetypes' : ['html', 'jsp', 'xhtml', 'xml', 'htm', 'php', 'aspvbs', 'mason']
      \ }
NeoBundleLazy 'jrestrepo/matlab', {
      \  'filetypes' : 'matlab'
      \ }
NeoBundleLazy 'vim-scripts/autohotkey-ahk', {
      \  'filetypes' : 'autohotkey'
      \ }
" NeoBundleLazy 'tpope/vim-speeddating', {
"       \  'filetypes' : ['org', 'vimwiki']
"       \ }
NeoBundleLazy 'hdima/python-syntax', {
      \  'filetypes' : 'python'
      \ }
NeoBundleLazy 'elzr/vim-json', {
      \  'filetypes' : 'json'
      \ }
NeoBundleLazy 'digitaltoad/vim-jade', {
      \ 'filetypes' : 'jade'
      \ }
NeoBundleLazy 'justinmk/vim-syntax-extra', {
      \ 'filetypes' : ['c', 'cpp', 'lex', 'yacc']
      \ }
NeoBundleLazy 'jnwhiteh/vim-golang', {
      \ 'filetypes' : 'go'
      \ }
NeoBundleLazy 'rcmdnk/vim-markdown', {
      \ 'filetypes' : 'markdown'
      \ }
NeoBundleLazy 'lervag/vim-latex', {
      \ 'filetypes' : 'tex'
      \ }
let g:vim_markdown_initial_foldlevel=99
NeoBundleLazy 'kannokanno/previm', {
      \ 'filetypes' : ['markdown', 'rst'],
      \ 'depends' : 'tyru/open-browser.vim',
      \ }
NeoBundleLazy 'tyru/open-browser.vim', {
      \ 'mappings' : '<Plug>',
      \ }
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundleLazy 'Chiel92/vim-autoformat', {
      \ 'commands' : [
      \   { 'name' : 'Autoformat',
      \     'complete' : 'filetype' },
      \ ]}
NeoBundle 'briancollins/vim-jst'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gabesoft/vim-java', {
      \  'filetypes' : 'java'
      \ }
NeoBundleLazy 'kamichidu/javacomplete', {
      \  'filetypes' : 'java'
      \ }
" let g:neocomplete#sources#omni#functions.java = 'javacomplete#Complete'
NeoBundleLazy 'yuratomo/java-api-complete', {
      \  'filetypes' : 'java'
      \ }
NeoBundleLazy 'yuratomo/java-api-javax', {
      \  'filetypes' : 'java'
      \ }

NeoBundleLazy 'yuratomo/java-api-org'
NeoBundleLazy 'yuratomo/java-api-sun'
NeoBundleLazy 'yuratomo/java-api-servlet2.3'
NeoBundleLazy 'yuratomo/java-api-android'
" command! JavaApi setlocal omnifunc=javaapi#complete
command! JavaApi 
      \ let g:neocomplete#sources#omni#functions.java = 'javaapi#complete'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'cstrahan/vim-eclim', {
"       \ 'filetypes' : 'java',
"       \ 'commands' : 'Eclim'
"       \ }
" " if exists('*eclim#PingEclim') && eclim#PingEclim(0)
" let g:EclimCompletionMethod = 'omnifunc'
" " endif
" let g:EclimHtmlValidate = 0
" let g:EclimPythonValidate = 0
" let g:EclimJavascriptValidate = 0
" let g:EclimCValidate = 0
" let g:EclimPhpValidate = 0
" let g:EclimRubyValidate = 0
" let g:EclimScalaValidate = 0
" let g:EclimXmlValidate = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'filetypes' : 'javascript'
      \ }
" NeoBundleLazy 'pangloss/vim-javascript', {
"       \ 'filetypes' : 'javascript'
"       \ }
NeoBundleLazy 'aereal/jscomplete-vim', {
      \ 'filetypes' : 'javascript'
      \ }
NeoBundleLazy 'myhere/vim-nodejs-complete', {
      \ 'filetypes' : 'javascript'
      \ }
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \  'filetypes' : ['coffee', 'jade']
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if g:env#unix
"   NeoBundleLazy 'davidhalter/jedi-vim', {
"         \  'filetypes' : 'python'
"         \ }
"   let g:jedi#popup_select_first = 0
"   let g:jedi#popup_on_dot = 0
"   let g:jedi#auto_close_doc = 0
"   let g:jedi#show_call_signatures = 0
" endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mattn/emmet-vim', {
      \ 'filetypes' : ['html', 'xhtml', 'xml', 'htm', 'jsp', 'markdown', 'css',
      \                'less', 'sass', 'scss', 'php', 'jade', 'aspvbs', 'mason']
      \ }
let g:emmet_html5 = 0
" let g:user_emmet_expandabbr_key = "<c-y>y,"
" imap <C-Y>, <c-o>:call <SID>CallEmmet("EmmetExpandAbbr")<CR>
" nmap <C-Y>, :call emmet#expandAbbr(3,"")<cr>
" vmap <C-Y>, :call emmet#expandAbbr(2,"")<cr>
" function! s:CallEmmet(plug)
"   call feedkeys("\<plug>(".a:plug.")")
" endfunction
" let g:user_emmet_expandabbr_key = '<c-y>y,'
" autocmd FileType html,xhtml,xml,htm,jsp,css,less,sass,scss,php imap <buffer> <c-y>, <ESC><c-y>y,a
" autocmd FileType html,xhtml,xml,htm,jsp,css,less,sass,scss,php vmap <buffer> <c-y>, <c-y>y,


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vim-scripts/PDV--phpDocumentor-for-Vim', {
NeoBundleLazy 'stephpy/vim-phpdoc', {
      \ 'filetypes' : ['php' ,'html', 'xhtml', 'xml', 'htm']
      \ }
" inoremap <leader>8 <ESC>:call PhpDocSingle()<CR>i
" let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "Raidou <weirongxu.raidou@gmail.com> ".strftime("%Y-%m-%d")
" let g:pdv_cfg_Copyright = "20013-2013 ".g:pdv_cfg_Author
" let g:pdv_cfg_License = ""
nnoremap <leader>8 :call PhpDocSingle()<CR>
vnoremap <leader>8 :call PhpDocRange()<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/yiiprado.vim', {
      \  'filetypes' : 'yiiprado'
      \ }
autocmd BufNewFile,BufRead *.tpl setfiletype yiiprado


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gregsexton/MatchTag', {
      \ 'filetypes' : ['html', 'jsp', 'xhtml', 'xml',
      \                'htm', 'php', 'aspvbs', 'mason']
      \ }
NeoBundleLazy 'gcmt/breeze.vim', {
      \ 'filetypes' : ['html', 'jsp', 'xhtml', 'xml',
      \                'htm', 'php', 'aspvbs', 'mason']
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'xsbeats/vim-blade', {
      \  'filetypes' : 'blade'
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \  'filetypes' : ['css', 'less', 'stylus']
      \ }
NeoBundleLazy 'groenewege/vim-less', {
      \  'filetypes' : 'less'
      \ }
NeoBundleLazy 'wavded/vim-stylus', {
      \  'filetypes' : ['stylus', 'jade']
      \ }
autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufNewFile,BufRead *.stylus set filetype=stylus
" NeoBundleLazy 'weirongxu/vim-less', {
"       \  'filetypes' : ['less']
"       \ }
" " less 自动编译
" let g:less_auto_compile = 0
" let g:less_compile_buffer_key = '<F5>'
" let g:less_compile_option = '-x'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vim-scripts/OmniCppComplete', {
"       \  'filetypes' : ['cpp', 'c']
"       \ }
" 自动生成tags文件
" autocmd! BufWritePost,FileWritePost *.h,*.hpp,*.c,*.cpp call <SID>CompileCtags()
" func! s:CompileCtags()
  " " call system('ctags -R --c++-kinds=+p --fields=+iaS --extra=+q')
  " call system('ctags * --c++-kinds=+p --fields=+iaS --extra=+q')
" endfunc
" let &tags .= ','.$MYVIMFILES.'/tags/cppstl'
" execute 'set tags+='.$MYVIMFILES.'/tags/cppstl'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'osyo-manga/vim-marching', {
      \  'filetypes' : ['cpp', 'c']
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
"         \  'filetypes' : ['cpp', 'c']
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
" NeoBundleLazy 'weirongxu/mkdview.vim', {
"       \  'filetypes' : 'markdown'
"       \ }
" let g:mkdview#css = 'github.css'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TOOLS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'junegunn/vader.vim', {
      \ 'commands': 'Vader',
      \ 'filetypes': 'vader',
      \ }
NeoBundle 'thinca/vim-scall'
NeoBundle 'kana/vim-vspec'
NeoBundleLazy 'KabbAmine/zeavim.vim', {
      \ 'mappings': ['<leader>z', '<leader>z',
      \ '<leader>Z', '<leader><leader>z',
      \ ],
      \ 'commands': ['Zeavim', 'ZvV', 'ZvK', 'ZvKD', 'Docset']
      \ }
NeoBundleLazy 'januswel/tabshift.vim', {
      \ 'commands': 'TabShift'
      \}
NeoBundleLazy 'januswel/sweepbuf.vim', {
      \ 'commands': 'SweepBuffers'
      \}
NeoBundleLazy 'szw/vim-maximizer', {
      \ 'commands': 'MaximizerToggle'
      \ }
map <space>a :MaximizerToggle<CR>
NeoBundleLazy 'rhysd/vim-grammarous', {
      \ 'commands' : [{ 'name': 'GrammarousCheck',
      \                 'complete': 'customlist,grammarous#complete_opt'}
      \ ]}
NeoBundleLazy 'salsifis/vim-transpose', {
      \   'commands': [
      \     'Transpose', 'TransposeWords', 'TransposeTab', 'TransposeCSV',
      \   'TransposeInteractive', 'TransposeIndentToggle'
      \ ]}
NeoBundleLazy 'tpope/vim-characterize', {
      \ 'mappings' : 'ga'
      \ }
NeoBundleLazy 'jmcantrell/vim-virtualenv', {
      \ 'commands' : [{'name': 'VirtualEnvActivate',
      \                'complete': 'customlist,CompleteVirtualEnv' },
      \   'VirtualEnvDeactivate', 'VirtualEnvList'],
      \ }
function! CompleteVirtualEnv(arg_lead, cmd_line, cursor_pos)
    return virtualenv#names(a:arg_lead)
endfunction
let g:virtualenv_directory = '~/Envs'
NeoBundleLazy 'weirongxu/fixdir.vim', {
      \ 'commands' : [{ 'name': 'FixDir',
      \                 'complete': 'customlist,fixdir#complete'}
      \ ]}
NeoBundleLazy 'thinca/vim-prettyprint', {
      \ 'commands' : 'PP'
      \ }
NeoBundleLazy 'kana/vim-narrow', {
      \ 'commands' : 'Narrow'
      \ }
NeoBundleLazy 'Shougo/vinarise.vim', {
      \ 'commands' : ['Vinarise', 'VinariseScript2Hex', 'VinariseHex2Script',
      \               'VinarisePluginDump', 'VinarisePluginViewBitmapView']
      \ }
NeoBundleLazy 'tyru/eskk.vim', {
      \ 'commands' : '<Plug>(eskk:toggle)'
      \ }
imap <c-=> <Plug>(eskk:toggle)
NeoBundleLazy 'drmikehenry/vim-fontsize', {
      \ 'mappings' : '<Plug>Fontsize'
      \ }
nmap <silent> <Leader>=           <Plug>FontsizeBegin
nmap <silent> <C-ScrollWheelUp>   <Plug>FontsizeInc
nmap <silent> <Leader>+           <Plug>FontsizeInc
nmap <silent> <C-ScrollWheelDown> <Plug>FontsizeDec
nmap <silent> <Leader>-           <Plug>FontsizeDec
nmap <silent> <Leader>0           <Plug>FontsizeDefault
NeoBundleLazy 'dhruvasagar/vim-table-mode', {
      \ 'mappings' : '<Leader>tm'
      \ }
NeoBundleLazy 'jaxbot/semantic-highlight.vim', {
      \ 'commands' : 'SemanticHighlightToggle'
      \ }
nnoremap <Leader>s :SemanticHighlightToggle<cr>
NeoBundleLazy 'osyo-manga/vim-over', {
      \ 'commands' : 'OverCommandLine'
      \ }
NeoBundleLazy 'vim-scripts/DrawIt', {
      \ 'commands' : ['DIstart', 'DIsngl', 'DIdbl', 'DIstop', 'DrawIt'],
      \ 'mappings' : ['<leader>di', '<leader>ds']
      \ }
NeoBundleLazy 'vim-scripts/VisIncr', {
      \ 'commands' : [
      \   'I', 'II', 'IB', 'IIB', 'IO', 'IIO',
      \   'IX', 'IIX', 'IYMD', 'IMDY', 'IDMY',
      \   'IA', 'ID', 'IM', 'IPOW', 'IIPOW'
      \ ]}
NeoBundleLazy 'tpope/vim-eunuch', {
      \ 'commands' : ['Unlink', 'Remove', 'Move',
      \               'Rename', 'Chmod', 'Find',
      \               'Locate', 'SudoWrite', 'W']
      \ }
NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'commands' : 'QuickRun'
      \ }
NeoBundleLazy 'joonty/vdebug', {
      \ 'commands' : ['VdebugEval', 'VdebugOpt', 'VdebugStart']
      \ }
NeoBundleLazy 'mattn/emoji-vim', {
      \ 'commands' : 'Emoji',
      \ 'type' : 'nosync'
      \ }
NeoBundleLazy 'thinca/vim-ref', {
      \ 'commands' : 'Ref',
      \ 'mappings' : '<Plug>(ref-keyword)'
      \ }
let g:ref_phpmanual_path = expand('~/Documents/ref/php-chunked-xhtml/')
map K <Plug>(ref-keyword)
" NeoBundleLazy 'tpope/vim-dispatch', {
"       \ 'commands' : ['Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start']
"       \ }
NeoBundleLazy 'justinmk/vim-gtfo', {
      \ 'mappings' : ['got', 'goT', 'gof', 'goF']
      \ }
NeoBundleLazy 'vim-jp/vital.vim', {
      \ 'commands' : 'Vitalize'
      \ }
NeoBundleLazy 'wesleyche/SrcExpl', {
      \ 'commands' : ['SrcExpl', 'SrcExplClose', 'SrcExplToggle']
      \ }
" NeoBundleLazy 'junegunn/goyo.vim', {
"       \ 'commands' : ['Goyo']
"       \ }
" NeoBundleLazy 'joedicastro/DirDiff.vim', {
NeoBundleLazy 'zhaocai/DirDiff.vim', {
      \ 'commands': [
      \   {'name' : 'DirDiff', 'complete' : 'dir'},
      \   'DirDiffOpen', 'DirDiffNext',
      \   'DirDiffPrev', 'DirDiffUpdate', 'DirDiffQuit'
      \ ]}
NeoBundleLazy 'matze/vim-move', {
      \ 'mappings': ['<M-k>', '<M-j>']
      \ }
let g:move_key_modifier = 'M'
let g:move_auto_indent = 0
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
      \ 'mappings': ['gS', 'gJ']
      \ }
NeoBundleLazy 'osyo-manga/vim-jplus', {
      \ 'mappings': '<Plug>(jplus'
      \ }
nmap J <Plug>(jplus)
vmap J <Plug>(jplus)
nmap <Leader>J <Plug>(jplus-getchar)
vmap <Leader>J <Plug>(jplus-getchar)
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/gist-vim', {
      \ 'commands': 'Gist',
      \ 'functions' : 'gist#list'
      \ }
let g:gist_token_file = expand('~/.record/github-token')

NeoBundleLazy 'jaxbot/github-issues.vim', {
      \ 'commands': ['Gissues', 'Giadd', 'Giedit', 'Giupdate', 'Gmiles']
      \ }
let github_token_file = g:gist_token_file
if filereadable(github_token_file)
  let g:github_access_token = strpart(join(readfile(github_token_file), ""), 6)
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/evervim', {
      \ 'commands' : ['EvervimNotebookList', 'EvervimListTags',
      \               'EvervimSearchByQuery', 'EvervimPageNext',
      \               'EvervimPagePrev', 'EvervimCreateNote',
      \               'EvervimOpenBrowser', 'EvervimOpenClient',
      \               'EvervimSetup', 'EvervimReloadPref']
      \ }
let g:evervim_host = 'app.yinxiang.com'
let devtoken_file = expand("~/.evernote-devtoken")
if filereadable(devtoken_file)
  let g:evervim_devtoken = readfile(devtoken_file)[0]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'xieyu/pyclewn', {
      \ 'commands' : 'Pyclewn'
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mbbill/undotree', {
      \ 'commands' : [
      \   'UndotreeToggle', 'UndotreeFocus', 'UndotreeShow', 'UndotreeHide'
      \ ]}
command! Undotree UndotreeToggle
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'commands' : [
      \   'GundoToggle', 'GundoHide', 'GundoRendGraph', 'GundoShow'
      \ ]}
command! Gundo GundoToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'junegunn/vim-easy-align', {
      \ 'mappings' : ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
      \ 'commands' : ['EasyAlign', 'LiveEasyAlign']
      \ }
vmap <Enter> <Plug>(LiveEasyAlign)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'commands' : ['TagbarOpen', 'TagbarClose', 'TagbarToggle', 'Tagbar',
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
      \ 'mappings' : ['<c-a>', '<c-x>']
      \ }
let g:sunday_pairs = [
    \   ['extends', 'implements'],
    \   ['require', 'require_once', 'include', 'include_once'],
    \   ['NeoBundle', 'NeoBundleLazy'],
    \ ]


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vimwiki/vimwiki', 'dev', { " 用dev版的todo列表没有样式了
NeoBundleLazy 'vimwiki/vimwiki', {
      \ 'filetypes' : 'vimwiki',
      \ 'commands' : ['VimwikiIndex', 'VimwikiTabIndex', 'VimwikiUISelect',
      \               'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote',
      \               'VimwikiTabMakeDiaryNote'],
      \ 'mappings' : ['<Leader>ww', '<Plug>VimwikiIndex', '<Leader>wt',
      \               '<Plug>VimwikiTabIndex', '<Leader>ws', '<Plug>VimwikiUISelect',
      \               '<Leader>wi', '<Plug>VimwikiDiaryIndex', '<Leader>w<Leader>w',
      \               '<Plug>VimwikiMakeDiaryNote', '<Leader>w<Leader>t', '<Plug>VimwikiTabMakeDiaryNote',
      \               '<LocalLeader>cal', '<LocalLeader>caL']
      \ }
Include rc/vimwiki


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'itchyny/calendar.vim' " XXX wait
" let g:calendar_google_task = 1
NeoBundleLazy 'mattn/calendar-vim', {
      \ 'commands' : ['Calendar', 'CalendarH', 'CalendarT'],
      \ 'mappings' : ['<LocalLeader>cal', '<LocalLeader>caL']
      \ }
map gC :Calendar<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vimshell.vim', {
      \ 'commands' : ['VimShell', 'VimShellCreate', 'VimShellTab', 'VimShellPop',
      \               'VimShellCurrentDir', 'VimShellBufferDir', 'VimShellExecute',
      \               'VimShellInteractive', 'VimShellTerminal', 'VimShellSendString',
      \               'VimShellSendBuffer']
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 't9md/vim-smalls', {
"       \ 'mappings' : ['<Plug>(smalls)']
"       \ }
" nmap s <Plug>(smalls)
" omap s <Plug>(smalls)
" xmap s <Plug>(smalls)
" NeoBundleLazy 'justinmk/vim-sneak'
"       \ 'mappings' : ['<Plug>Sneak']
"       \ }
" let g:sneak#f_reset = 1
" let g:sneak#t_reset = 1
" map <space> <Plug>SneakNext
" map <s-space> <Plug>SneakPrevious
NeoBundleLazy 'Lokaltog/vim-easymotion', {
       \ 'mappings' : ['<Plug>(easymotion-', 's']
       \ }
let g:EasyMotion_leader_key = 's'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" nmap sS <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
nmap sl <Plug>(easymotion-sl)
""""""""""""""""""""""""""""""
NeoBundle 'saihoooooooo/glowshi-ft.vim'

" NeoBundle 'junegunn/vim-pseudocl'
" NeoBundle 'junegunn/vim-oblique'
" let g:oblique#incsearch_highlight_all=1

NeoBundle 'thinca/vim-visualstar'
NeoBundleLazy 'osyo-manga/vim-anzu', {
      \ 'mappings' : '<Plug>(anzu-'
      \ }
nmap n <Plug>(anzu-n-with-echo)
nmap N <Plug>(anzu-N-with-echo)

NeoBundleLazy 'haya14busa/incsearch.vim', {
      \ 'mappings' : '<Plug>(incsearch-'
      \ }
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
let g:incsearch#highlight = {
\   'on_cursor' : {
\     'priority' : '100'
\   },
\   'cursor' : {
\     'group' : 'ErrorMsg',
\     'priority' : '1000'
\   }
\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'tpope/vim-afterimage' " Crazy!
" NeoBundle 'jszakmeister/vim-togglecursor'
" NeoBundle 'vim-scripts/mru.vim' " 用ctrlp代替
" NeoBundle 'Rykka/galaxy.vim' " 还用不上
" NeoBundle 'sukima/xmledit' " 好像没什么用
" NeoBundle 'vim-scripts/jsbeautify' " 用vim-jsbeautify
" NeoBundle 'vim-scripts/colorizer' " 用colorv
" NeoBundle 'vim-scripts/taglist.vim' " 用tagbar
" NeoBundle 'vim-scripts/Color-Sampler-Pack' " 没怎么用
" NeoBundleLazy 'jceb/vim-orgmode' " vimwiki
" NeoBundleLazy 'vim-scripts/utl.vim' " 打开链接,不好用
" NeoBundle 'millermedeiros/vim-statline' " 用airline
" NeoBundle 'Lokaltog/powerline' " 用airline
" NeoBundle 'bling/vim-airline' " 因为lightline
" NeoBundle 'Townk/vim-autoclose' " <esc>要刷新buffer，和neocomplete冲突。
" NeoBundle 'Raimondi/delimitMate' " 用jiangmiao/auto-pairs
" NeoBundle 'itchyny/vim-cmdline-ranges'
" NeoBundle 'yuratomo/gmail.vim'
" NeoBundle 'Rykka/easydigraph.vim'
" NeoBundle 'FredKSchott/CoVim'
" NeoBundle 'kana/vim-smartchr'
" inoremap <expr> - smartchr#one_of('->', '-')
" NeoBundle 'kana/vim-smartword', {
"       \ 'mappings' : '<Plug>(smartword-'
"       \ }
" nmap w  <Plug>(smartword-w)
" nmap b  <Plug>(smartword-b)
" nmap e  <Plug>(smartword-e)
" nmap ge <Plug>(smartword-ge)
" vmap w  <Plug>(smartword-w)
" vmap b  <Plug>(smartword-b)
" vmap e  <Plug>(smartword-e)
" vmap ge <Plug>(smartword-ge)
" NeoBundleLazy 'rhysd/accelerated-jk'
" NeoBundle 'thinca/vim-painter' " toy
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe' " waitting
""""""""""""""""""""""""""""""
" UI
" NeoBundle 'rbtnn/rabbit-ui.vim'
" NeoBundle 'itchyny/thumbnail.vim' " 速度不行
" NeoBundleLazy 't9md/vim-choosewin' " 速度慢
""""""""""""""""""""""""""""""
" Game
" NeoBundle 'rbtnn/game_engine.vim'
" NeoBundle 'rbtnn/puyo.vim'
" NeoBundle 'rbtnn/mario.vim'
" NeoBundle 'rbtnn/vimconsole.vim'
" NeoBundle 'katono/rogue.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call neobundle#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其它插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 打开 javascript 对 dom、html 和 css 的支持
let javascript_enable_domhtmlcss = 1

" 设置 javascriptlint
" autocmd FileType javascript set makeprg=jsl\ -process\ %

" 设置vimIM
let g:vimim_plugin = 'wubi,pinyin'
let g:vimim_cloud=-1
let g:vimim_map='no-search'
" imap <c-c> <c-_>
