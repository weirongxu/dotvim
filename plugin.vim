"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用neobundle来安装插件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYBUNDLEDIR.'/neobundle.vim'
endif

call neobundle#rc(expand($MYBUNDLEDIR))
call neobundle#local(expand($MYBUNDLEDIR.'-common'), {})

" if g:env#unix
  " call neobundle#local(expand($MYBUNDLEDIR.'-unix'), {})
" elseif g:env#win
  " call neobundle#local(expand($MYBUNDLEDIR.'-win32'), {})
" endif


" Neobundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neobundle.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #    #  #    #   ####    #####
" ##  ##  #    #  #          #
" # ## #  #    #   ####      #
" #    #  #    #       #     #
" #    #  #    #  #    #     #
" #    #   ####    ####      #
" MUST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fencview Mark Surround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mbbill/fencview'
NeoBundle 'peterjmorgan/mark-2.8.0'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nacitar/a.vim'
NeoBundle 'wellle/targets.vim'
NeoBundle 'kshenoy/vim-signature'
let g:SignatureErrorIfNoAvailableMarks = 0
NeoBundle 'tpope/vim-repeat'
" NeoBundle 'benatkin/vim-move-between-tabs' " map tN tP
" NeoBundle 'jrhorn424/vim-multiple-cursors'
" NeoBundle 'plasticboy/vim-markdown'
" NeoBundle 'zhaocai/GoldenView.Vim'
" let g:goldenview__enable_default_mapping = 0
NeoBundle 'editorconfig/editorconfig-vim'
execute "source ".$MYVIMFILES."/editorconfig-vim.vim"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" think php tpl
" autocmd BufNewFile,BufRead *.html setfiletype htmlthphp.html
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" test
" NeoBundle 'Shougo/vesting'
NeoBundle 'junegunn/vader.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'weirongxu/vim-startify'
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
      \ ['   Sessions:'],
      \ 'sessions',
      \ ]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'gregsexton/gitv', {
      \ 'autoload' : {
      \   'commands' : ['Gitv']
      \ }}
NeoBundleLazy 'airblade/vim-gitgutter'
let g:gitgutter_enabled = 0
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
NeoBundleLazy 'mhinz/vim-signify'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" unite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'
map <Leader>u :Unite
map <Leader>U :UniteResume<cr>
" let g:unite_enable_start_insert = 1
" let g:unite_split_rule = "botright"
" let g:unite_winheight = 10
let g:unite_force_overwrite_statusline = 0

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <Leader>f :Unite vimgrep:
nnoremap <Leader><s-f> :Unite vimgrep:%<CR>
nnoremap <c-p> :Unite -buffer-name=files -start-insert file_rec<cr>

autocmd FileType unite call <SID>unite_settings()
function! s:unite_settings()
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-s> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <c-h> unite#do_action('rec_parent')

  map <silent><buffer><expr> x unite#do_action('split')
  map <silent><buffer><expr> s unite#do_action('split')
  map <silent><buffer><expr> v unite#do_action('vsplit')

  imap <buffer> <c-q> <Plug>(unite_exit)
  nmap <buffer> <c-q> <Plug>(unite_exit)
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
""""""""""""""""""""""""""""""
let g:unite_source_history_yank_enable = 1
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundleLazy 'Shougo/unite-session', {
      \ 'autoload' : {
      \   'commands' : ['UniteSessionSave', 'UniteSessionLoad']
      \ }}
" let g:unite_source_session_enable_auto_save = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" TComment
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


""""""""""""""""""""""""""""""
" lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'itchyny/lightline.vim'
if g:env#unix && g:env#x
  let g:lightline = {
        \   'colorscheme': 'jellybeans',
        \   'component': {
        \     'readonly': '%{&filetype=="help"?"":&readonly?"?":""}',
        \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
        \   },
        \   'separator': { 'left': '?', 'right': '?' },
        \   'subseparator': { 'left': '?', 'right': '?' }
        \ }
else
  let g:lightline = {
        \   'colorscheme': 'jellybeans',
        \   'component': {
        \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
        \     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
        \   }
        \ }
endif
" 显示换行和制表符
set list listchars=tab:\|\ ,trail:.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_fileTypeExclude = ['', 'stylus', 'jade', 'vimfiler']
let g:indentLine_faster = 1 " XXX Exists bug with jade and stylus syntax and vimfiler
if !g:env#x
  let g:indentLine_color_term = 8
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" ColorV
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Rykka/colorv.vim'
" 颜色显示 使用ColorV
let g:colorv_preview_ftype = 'css,html,php,jsp,aspvbs,mason,javascript,htm,less,stylus'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NeoComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleLazy 'Shougo/neocomplcache.vim'
  execute "source ".$MYVIMFILES."/neocomplete.vim"
else
  NeoBundle 'Shougo/neocomplcache.vim'
  NeoBundleLazy 'Shougo/neocomplete.vim'
  execute "source ".$MYVIMFILES."/neocomplcache.vim"
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NeoSnippet
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
" command Snip NeoSnippetEdit -split -vertical -runtime
command! Snip NeoSnippetEdit -split -vertical
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" auto-pairs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 1
let g:AutoPairsMapSpace = 0
let g:AutoPairs = {
      \ '(': ')',
      \ '[': ']',
      \ "'": "'",
      \ '"': '"',
      \ '`': '`'}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" wildfire
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'gcmt/wildfire.vim'
" let g:wildfire_fuel_map = "<c-cr>"
if g:env#gui
  map <C-CR> <Plug>(wildfire-fuel)
else
  map <NL> <Plug>(wildfire-fuel)
endif
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/syntastic'
if g:env#win
  let g:syntastic_error_symbol = 'x>'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
else
  let g:syntastic_error_symbol = '?'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '?'
  let g:syntastic_style_warning_symbol = 'S>'
endif
" let g:syntastic_php_checkers=['php']
map <space> :w<CR>:SyntasticCheck<CR>
      " \ 'mode': 'active',
let g:syntastic_mode_map = {
      \ 'mode': 'passive',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['java', 'less'] }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #######
" #           #    #       ######   #####   #   #  #####   ######
" #           #    #       #          #      # #   #    #  #
" #####       #    #       #####      #       #    #    #  #####
" #           #    #       #          #       #    #####   #
" #           #    #       #          #       #    #       #
" #           #    ######  ######     #       #    #       ######
" FILETYPE
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Matchit Html5 Matlab Ahk
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'vim-scripts/matchit.zip', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'jsp', 'xhtml', 'xml', 'htm', 'php', 'aspvbs', 'mason'] }}
NeoBundleLazy 'othree/html5.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'jsp', 'xhtml', 'xml', 'htm', 'php', 'aspvbs', 'mason'] }}
NeoBundleLazy 'jrestrepo/matlab', {
      \ 'autoload' : { 'filetypes' : 'matlab' }}
NeoBundleLazy 'vim-scripts/autohotkey-ahk', {
      \ 'autoload' : { 'filetypes' : 'autohotkey' }}
NeoBundleLazy 'tpope/vim-speeddating', {
      \ 'autoload' : { 'filetypes' : ['org', 'vimwiki'] }}
NeoBundleLazy 'hdima/python-syntax', {
      \ 'autoload' : { 'filetypes' : 'python' }}
NeoBundleLazy 'elzr/vim-json', {
      \ 'autoload' : { 'filetypes' : 'json' }}
NeoBundleLazy 'digitaltoad/vim-jade', {
      \ 'autoload' : { 'filetypes' : 'jade' }}
" NeoBundleLazy 'spf13/PIV', {
      " \ 'autoload' : { 'filetypes' : 'php' }}
NeoBundleLazy 'kepbod/php_indent', {
      \ 'autoload' : { 'filetypes' : 'php' }}
NeoBundleLazy 'justinmk/vim-syntax-extra', {
      \ 'autoload' : { 'filetypes' : ['c', 'cpp', 'lex', 'yacc'] }}
NeoBundleLazy 'jnwhiteh/vim-golang', {
      \ 'autoload' : { 'filetypes' : ['go'] }}
NeoBundle 'maksimr/vim-jsbeautify'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Java
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gabesoft/vim-java', {
      \ 'autoload' : { 'filetypes' : 'java' }}
" NeoBundleLazy 'VictorDenisov/javacomplete', {
"       \ 'autoload' : { 'filetypes' : 'java' }}
NeoBundleLazy 'yuratomo/java-api-complete', {
      \ 'autoload' : { 'filetypes' : 'java' }}
NeoBundleLazy 'yuratomo/java-api-javax', {
      \ 'autoload' : { 'filetypes' : 'java' }}

NeoBundleLazy 'yuratomo/java-api-org'
NeoBundleLazy 'yuratomo/java-api-sun'
NeoBundleLazy 'yuratomo/java-api-servlet2.3'
NeoBundleLazy 'yuratomo/java-api-android'
" command! JavaApi setlocal omnifunc=javaapi#complete
command! JavaApi 
      \ let g:neocomplete#sources#omni#functions.java = 'javaapi#complete'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Eclim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'cstrahan/vim-eclim', {
      \ 'autoload' : {
      \   'filetypes' : ['java'],
      \   'commands' : ['Eclim']
      \ }}
" if exists('*eclim#PingEclim') && eclim#PingEclim(0)
let g:EclimCompletionMethod = 'omnifunc'
" endif
let g:EclimHtmlValidate = 0
let g:EclimPythonValidate = 0
let g:EclimJavascriptValidate = 0
let g:EclimCValidate = 0
let g:EclimPhpValidate = 0
let g:EclimRubyValidate = 0
let g:EclimScalaValidate = 0
let g:EclimXmlValidate = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" nodejs complete ~jshint~ coffee
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'jelera/vim-javascript-syntax', {
      \ 'autoload' : { 'filetypes' : 'javascript' }}
" NeoBundleLazy 'pangloss/vim-javascript', {
"       \ 'autoload' : { 'filetypes' : 'javascript' }}
NeoBundleLazy 'aereal/jscomplete-vim', {
      \ 'autoload' : { 'filetypes' : 'javascript' }}
NeoBundleLazy 'myhere/vim-nodejs-complete', {
      \ 'autoload' : { 'filetypes' : 'javascript' }}
let g:nodejs_complete_config = {
\  'js_compl_fn': 'jscomplete#CompleteJS',
\  'max_node_compl_len': 15
\}
NeoBundleLazy 'kchmck/vim-coffee-script', {
      \ 'autoload' : { 'filetypes' : ['coffee', 'jade'] }}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Jedi
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'davidhalter/jedi-vim', {
"       \ 'autoload' : { 'filetypes' : 'python' }}
" let g:jedi#popup_select_first = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#auto_close_doc = 0
" let g:jedi#show_call_signatures = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mattn/emmet-vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'xhtml', 'xml', 'htm', 'jsp', 'markdown', 'css',
      \                  'less', 'sass', 'scss', 'php', 'jade', 'aspvbs', 'mason']
      \ }}
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


""""""""""""""""""""""""""""""
" PhpDocumentor
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vim-scripts/PDV--phpDocumentor-for-Vim', {
NeoBundleLazy 'stephpy/vim-phpdoc', {
      \ 'autoload' : { 'filetypes' : ['php' ,'html', 'xhtml', 'xml', 'htm'] }}
" inoremap <leader>8 <ESC>:call PhpDocSingle()<CR>i
" let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "Raidou <weirongxu.raidou@gmail.com> ".strftime("%Y-%m-%d")
" let g:pdv_cfg_Copyright = "20013-2013 ".g:pdv_cfg_Author
" let g:pdv_cfg_License = ""
nnoremap <leader>8 :call PhpDocSingle()<CR>
vnoremap <leader>8 :call PhpDocRange()<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" YiiPradoTemplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/yiiprado.vim', {
      \ 'autoload' : { 'filetypes' : ['yiiprado'] }}
autocmd BufNewFile,BufRead *.tpl setfiletype yiiprado
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" MatchTag
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gregsexton/MatchTag', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'jsp', 'xhtml', 'xml',
      \                  'htm', 'php', 'aspvbs', 'mason'] }}
" NeoBundleLazy 'gcmt/breeze.vim', {
"       \ 'autoload' : {
"       \   'filetypes' : ['html', 'jsp', 'xhtml', 'xml',
"       \                  'htm', 'php', 'aspvbs', 'mason'] }}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" LaravelBladeTemplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'xsbeats/vim-blade', {
      \ 'autoload' : { 'filetypes' : ['blade'] }}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Less styl Css
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'autoload' : { 'filetypes' : ['css', 'less', 'stylus'] }}
NeoBundleLazy 'groenewege/vim-less', {
      \ 'autoload' : { 'filetypes' : ['less'] }}
NeoBundleLazy 'wavded/vim-stylus', {
      \ 'autoload' : { 'filetypes' : ['stylus', 'jade'] }}
autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufNewFile,BufRead *.stylus set filetype=stylus
" NeoBundleLazy 'weirongxu/vim-less', {
"       \ 'autoload' : { 'filetypes' : ['less'] }}
" " less 自动编译
" let g:less_auto_compile = 0
" let g:less_compile_buffer_key = '<F5>'
" let g:less_compile_option = '-x'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" OmniCppComplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vim-scripts/OmniCppComplete', {
      " \ 'autoload' : { 'filetypes' : ['cpp', 'c'] }}
" 自动生成tags文件
" autocmd! BufWritePost,FileWritePost *.h,*.hpp,*.c,*.cpp call <SID>CompileCtags()
" func! s:CompileCtags()
  " " call system('ctags -R --c++-kinds=+p --fields=+iaS --extra=+q')
  " call system('ctags * --c++-kinds=+p --fields=+iaS --extra=+q')
" endfunc
" let &tags .= ','.$MYVIMFILES.'/tags/cppstl'
" execute 'set tags+='.expand($MYVIMFILES).'/tags/cppstl'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Clang_complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:env#unix && executable('clang')
  NeoBundleLazy 'Rip-Rip/clang_complete', {
        \ 'autoload' : { 'filetypes' : ['cpp', 'c'] }}
  " let g:clang_complete_copen = 1
  let g:clang_complete_auto = 0
  let g:clang_auto_select = 0
  let g:clang_use_library = 1
  let g:clang_library_path = '/usr/lib/'
  let g:neocomplete#force_omni_input_patterns.c =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.cpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#force_omni_input_patterns.objc =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*'
  let g:neocomplete#force_omni_input_patterns.objcpp =
        \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
  let g:neocomplete#sources#omni#functions.c = 'ClangComplete'
  let g:neocomplete#sources#omni#functions.cpp = 'ClangComplete'
  let g:neocomplete#sources#omni#functions.objc = 'ClangComplete'
  let g:neocomplete#sources#omni#functions.objcpp = 'ClangComplete'
else
    NeoBundleLazy 'Rip-Rip/clang_complete'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" MkdView
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/mkdview.vim', {
      \ 'autoload' : { 'filetypes' : 'markdown' }}
let g:mkdview#css = 'github.css'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #######
"    #      ####    ####   #        ####
"    #     #    #  #    #  #       #
"    #     #    #  #    #  #        ####
"    #     #    #  #    #  #            #
"    #     #    #  #    #  #       #    #
"    #      ####    ####   ######   ####
" TOOLS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Hexman DrawIt VisIncr Eunuch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vinarise.vim', {
      \ 'autoload' : {
      \   'commands' : ['Vinarise', 'VinariseScript2Hex', 'VinariseHex2Script',
      \                 'VinarisePluginDump', 'VinarisePluginViewBitmapView']
      \ }}
" NeoBundleLazy 'vim-scripts/hexman.vim', {
"       \ 'autoload' : { 'mappings' : '<Leader>h' }}
NeoBundleLazy 'vim-scripts/DrawIt', {
      \ 'autoload' : {
      \   'commands' : ['DIstart', 'DIsngl', 'DIdbl', 'DIstop', 'DrawIt'],
      \   'mappings' : ['<leader>di', '<leader>ds']
      \ }}
NeoBundleLazy 'vim-scripts/VisIncr', {
      \ 'autoload' : {
      \   'commands' : [
      \     'I', 'II', 'IB', 'IIB', 'IO', 'IIO',
      \     'IX', 'IIX', 'IYMD', 'IMDY', 'IDMY',
      \     'IA', 'ID', 'IM', 'IPOW', 'IIPOW'
      \   ]
      \ }}
NeoBundleLazy 'tpope/vim-eunuch', {
      \ 'autoload' : {
      \   'commands' : ['Unlink', 'Remove', 'Move',
      \                 'Rename', 'Chmod', 'Find',
      \                 'Locate', 'SudoWrite', 'W']
      \ }}
NeoBundleLazy 'thinca/vim-quickrun', {
      \ 'autoload' : { 'commands' : ['QuickRun'] }}
NeoBundleLazy 'joonty/vdebug', {
      \ 'autoload' : {
      \   'commands' : ['VdebugEval', 'VdebugOpt', 'VdebugStart']
      \ }}
NeoBundleLazy 'mattn/emoji-vim', {
      \ 'autoload' : {
      \   'commands' : ['Emoji']
      \ }, 'type' : 'nosync' }
NeoBundleLazy 'thinca/vim-ref', {
      \ 'autoload' : {
      \   'commands' : ['Ref']
      \ }}
" NeoBundleLazy 'tpope/vim-dispatch', {
"       \ 'autoload' : {
"       \   'commands' : ['Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start']
"       \ }}
NeoBundleLazy 'justinmk/vim-gtfo', {
      \ 'autoload' : {
      \   'mappings' : ['got', 'goT', 'gof', 'goF']
      \ }}
NeoBundleLazy 'vim-jp/vital.vim', {
      \ 'autoload' : {
      \   'commands' : ['Vitalize']
      \ }}
NeoBundleLazy 'wesleyche/SrcExpl', {
      \ 'autoload' : {
      \   'commands' : ['SrcExpl', 'SrcExplClose', 'SrcExplToggle']
      \ }}
" NeoBundleLazy 'junegunn/goyo.vim', {
"       \ 'autoload' : {
"       \   'commands' : ['Goyo']
"       \ }}
NeoBundleLazy 'chenkaie/DirDiff.vim', {
      \ 'autoload': {
      \   'commands': ['DirDiff', 'DirDiffOpen', 'DirDiffNext',
      \                'DirDiffPrev', 'DirDiffUpdate', 'DirDiffQuit']
      \ }}
" NeoBundleLazy 't9md/vim-choosewin', {
"       \ 'autoload': {
"       \   'commands': ['ChooseWin', '<Plug>(choosewin)']
"       \ }}
" nmap - <Plug>(choosewin)
NeoBundleLazy 'matze/vim-move', {
      \ 'autoload': {
      \   'mappings': ['<M-k>', '<M-j>']
      \ }}
let g:move_key_modifier = 'M'
let g:move_auto_indent = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" evervim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/evervim', {
      \ 'autoload' : {
      \   'commands' : ['EvervimNotebookList', 'EvervimListTags',
      \                 'EvervimSearchByQuery', 'EvervimPageNext',
      \                 'EvervimPagePrev', 'EvervimCreateNote',
      \                 'EvervimOpenBrowser', 'EvervimOpenClient',
      \                 'EvervimSetup', 'EvervimReloadPref']
      \ }}
let g:evervim_host = 'app.yinxiang.com'
let devtoken_file = expand("~/.evernote-devtoken")
if filereadable(devtoken_file)
  let g:evervim_devtoken = readfile(devtoken_file)[0]
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" pyclewn
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'xieyu/pyclewn', {
      \ 'autoload' : {
      \   'commands' : [ 'Pyclewn' ]
      \ }}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     'GundoToggle', 'GundoHide', 'GundoRendGraph', 'GundoShow'
      \   ]
      \ }}
command! Gundo GundoToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Align
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'junegunn/vim-easy-align', {
      \ 'autoload' : {
      \   'mappings' : ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
      \   'commands' : ['EasyAlign', 'LiveEasyAlign']
      \ }}
" nmap <Leader>a <Plug>(EasyAlign)
" vmap <Enter>   <Plug>(EasyAlign)
vmap <Enter>   <Plug>(LiveEasyAlign)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'autoload' : {
      \   'commands' : ['TagbarOpen', 'TagbarClose', 'TagbarToggle', 'Tagbar',
      \                 'TagbarOpenAutoClose', 'TagbarTogglePause',
      \                 'TagbarSetFoldlevel', 'TagbarShowTag',
      \                 'TagbarCurrentTag', 'TagbarGetTypeConfig',
      \                 'TagbarDebug', 'TagbarDebugEnd']
      \ }}
map gl :TagbarToggle<CR>
execute "source ".$MYVIMFILES."/tagbar.vim"
let g:tagbar_show_linenumbers = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Sunday
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mattn/vim-sunday', {
      \ 'autoload' : {
      \   'mappings' : ['<c-a>', '<c-x>']
      \ }}
let g:sunday_pairs = [
    \   ['extends', 'implements'],
    \   ['require', 'require_once', 'include', 'include_once'],
    \ ]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'mattn/vimfiler-icn'
NeoBundleLazy 'Shougo/vimfiler.vim', {
      \ 'autoload' : {
      \   'commands' : ['VimFiler', 'VimFilerCreate', 'VimFilerSimple',
      \                 'VimFilerSplit', 'VimFilerTab', 'VimFilerDouble',
      \                 'VimFilerCurrentDir', 'VimFilerBufferDir',
      \                 'VimFilerExplorer', 'VimFilerClose']
      \ }}
autocmd FileType vimfiler call <SID>vimfiler_settings()
function! s:vimfiler_settings()
  nmap <buffer> t
        \ :<C-u>call vimfiler#mappings#do_action('tabopen')<CR>

  nmap <buffer> u <Plug>(vimfiler_switch_to_parent_directory)

  nmap <2-LeftMouse> <Plug>(vimfiler_edit_file)

  nunmap <buffer><silent> <C-l>
  nmap <buffer><silent> R <Plug>(vimfiler_redraw_screen)

  nunmap <buffer><silent> <C-j>
  command -buffer History call feedkeys("\<Plug>(vimfiler_switch_to_history_directory)")

  nunmap <buffer><silent> H
  command -buffer Shell call feedkeys("\<Plug>(vimfiler_popup_shell)")

  nunmap <buffer><silent> L
  command -buffer Drive call feedkeys("\<Plug>(vimfiler_switch_to_drive)")
endfunction
" autocmd BufEnter * setlocal autochdir " fixed some buf, in 
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_buf = 'VimFilerBufferDir -explorer -auto-cd -split'
let g:vimfiler_cmd = 'VimFiler -explorer -auto-cd -split'
execute 'map <silent> gn :' . vimfiler_buf .'<CR>'
map gc :edit $MYVIMRC<CR>
execute 'map <silent> gp :' . vimfiler_cmd . ' ' . $MYVIMFILES . '<CR>'
" scrooloose版本在win下切换磁盘会有问题
" NeoBundleLazy 'mixvin/nerdtree', {
" NeoBundleLazy 'scrooloose/nerdtree', {
"       \ 'autoload' : {
"       \   'commands' : ['NERDTree', 'NERDTreeFromBookmark',
"       \                 'NERDTreeToggle', 'NERDTreeMirror',
"       \                 'NERDTreeClose', 'NERDTreeFind',
"       \                 'NERDTreeCWD']
"       \ }}
" map gn :NERDTreeToggle<cr>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" VimWiki
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vimwiki/vimwiki', 'dev', { " 用dev版的todo列表没有样式了
NeoBundleLazy 'vimwiki/vimwiki', {
      \ 'autoload' : {
      \   'filetypes' : 'vimwiki',
      \   'commands' : ['VimwikiIndex', 'VimwikiTabIndex', 'VimwikiUISelect',
      \                 'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote',
      \                 'VimwikiTabMakeDiaryNote'],
      \   'mappings' : ['<Leader>ww', '<Plug>VimwikiIndex', '<Leader>wt',
      \                 '<Plug>VimwikiTabIndex', '<Leader>ws', '<Plug>VimwikiUISelect',
      \                 '<Leader>wi', '<Plug>VimwikiDiaryIndex', '<Leader>w<Leader>w',
      \                 '<Plug>VimwikiMakeDiaryNote', '<Leader>w<Leader>t', '<Plug>VimwikiTabMakeDiaryNote',
      \                 '<LocalLeader>cal', '<LocalLeader>caL']
      \ }}
execute "source ".$MYVIMFILES."/vimwiki.vim"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Calendar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'itchyny/calendar.vim' " XXX wait
" let g:calendar_google_task = 1
NeoBundleLazy 'mattn/calendar-vim', {
      \ 'autoload' : {
      \   'commands' : ['Calendar', 'CalendarH', 'CalendarT'],
      \   'mappings' : ['<LocalLeader>cal', '<LocalLeader>caL']
      \ }}
map gC :Calendar<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" VimShell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'Shougo/vimshell.vim', {
"       \ 'autoload' : {
"       \   'commands' : ['VimShell', 'VimShellCreate', 'VimShellTab', 'VimShellPop',
"       \                 'VimShellCurrentDir', 'VimShellBufferDir', 'VimShellExecute',
"       \                 'VimShellInteractive', 'VimShellTerminal', 'VimShellSendString',
"       \                 'VimShellSendBuffer']
"       \ }}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Indent-Guides
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'nathanaelkane/vim-indent-guides', {
"       \ 'autoload' : {
"       \   'commands' : ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
"       \   'mappings' : ['<Plug>IndentGuidesToggle', '<Plug>IndentGuidesEnable', '<Plug>IndentGuidesDisable']
"       \ },
"       \ 'gui': 1 }
" " 设置对齐线
" let g:indent_guides_guide_size = 1
" nmap <silent> gL <Plug>IndentGuidesToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" EasyMotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 't9md/vim-smalls', {
"       \ 'autoload' : {
"       \   'mappings' : ['<Plug>(smalls)']
"       \}}
" nmap s <Plug>(smalls)
" omap s <Plug>(smalls)
" xmap s <Plug>(smalls)
" NeoBundleLazy 'justinmk/vim-sneak'
"       \ 'autoload' : {
"       \   'mappings' : ['<Plug>Sneak']
"       \}}
" let g:sneak#f_reset = 1
" let g:sneak#t_reset = 1
" map <space> <Plug>SneakNext
" map <s-space> <Plug>SneakPrevious
NeoBundleLazy 'Lokaltog/vim-easymotion', {
      \ 'autoload' : {
      \   'mappings' : ['sf', 'sF', 'st', 'sT',
      \                 'sw', 'sW', 'sb', 'sB',
      \                 'se', 'sE', 'sge', 'sgE',
      \                 'sj', 'sk', 'sn', 'sN',
      \                 'ss']
      \}}
let g:EasyMotion_leader_key = 's'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Recover
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'tpope/vim-afterimage' " 用vim来编辑图片。It's crazy!
" NeoBundle 'vim-scripts/mru.vim' " 用ctrlp代替
" NeoBundle 'Rykka/galaxy.vim' " 还用不上
" NeoBundle 'sukima/xmledit' " 好像没什么用
" NeoBundle 'vim-scripts/jsbeautify' " jsff 它的效率不好
" NeoBundle 'vim-scripts/colorizer' " 用colorv代替
" NeoBundle 'vim-scripts/taglist.vim' " 用tagbar代替
" NeoBundle 'vim-scripts/Color-Sampler-Pack' " 没怎么用
" NeoBundleLazy 'jceb/vim-orgmode' " vimwiki伤不起
" NeoBundleLazy 'vim-scripts/utl.vim' " 这个打开链接不好用
" NeoBundle 'millermedeiros/vim-statline', {'base' : $MYBUNDLEDIR.'-win32'} " 还是用airline吧
" NeoBundle 'Lokaltog/powerline', {'base': $MYBUNDLEDIR.'-win32'} " 因为有airline
" NeoBundle 'kien/ctrlp.vim' " 被unite折服了。。。
" NeoBundle 'Townk/vim-autoclose' " ESC是要更新buffer，这样和neocomplete冲突了。
" NeoBundle 'Raimondi/delimitMate' " 还是jiangmiao/auto-pairs好使
" NeoBundle 'szw/vim-ctrlspace' " 这个确实不错，但是Shougo的unite。。。
" NeoBundle 'itchyny/vim-cmdline-ranges'
" NeoBundle 'itchyny/thumbnail.vim' " 切换窗口，用的不多
" NeoBundle 'yuratomo/gmail.vim' " 太疯狂
" NeoBundle 'Rykka/easydigraph.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe' " wait
" NeoBundle 'FredKSchott/CoVim' " 协作编辑wait
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



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
imap <c-c> <c-_>
" imap <c-c> <c-r>=<sid>open_vimwiki()<cr>
" function! s:open_vimwiki()
  " if exists("b:openVimim") && b:openVimim
    " let b:openVimim = 0
    " nunmap <buffer> i
  " else
    " let b:openVimim = 1
    " nmap <buffer> i i<cr>
  " endif
  " call feedkeys("\<c-_>")
  " return ''
" endfunction
