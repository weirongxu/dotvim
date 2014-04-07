""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 用neobundle来安装插件
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYBUNDLEDIR.'/neobundle.vim'
endif

call neobundle#rc(expand($MYBUNDLEDIR))
call neobundle#local(expand($MYBUNDLEDIR.'-common'), {})

" if has('unix')
  " call neobundle#local(expand($MYBUNDLEDIR.'-unix'), {})
" elseif has('win32')
  " call neobundle#local(expand($MYBUNDLEDIR.'-win32'), {})
" endif


" Neobundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/neobundle.vim'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #    #  #    #   ####    #####
" ##  ##  #    #  #          #
" # ## #  #    #   ####      #
" #    #  #    #       #     #
" #    #  #    #  #    #     #
" #    #   ####    ####      #
" MUST
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fencview Mark Surround Fugitive...
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mbbill/fencview'
NeoBundle 'peterjmorgan/mark-2.8.0'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'motemen/git-vim'
NeoBundle 'benatkin/vim-move-between-tabs' " map tN tP
NeoBundle 'nacitar/a.vim'
NeoBundle 'editorconfig/editorconfig-vim'
NeoBundle 'wellle/targets.vim'
NeoBundle 'vim-jp/vital.vim'
NeoBundle 'Yggdroot/indentLine'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Translate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'bolasblack/gtrans.vim'
NeoBundle 'jiazhoulvke/googletranslate'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" unite
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/unite.vim'
map <Leader>u :Unite
map <Leader>U :UniteResume<cr>
" let g:unite_enable_start_insert = 1
let g:unite_split_rule = "botright"
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 10

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
nnoremap <Leader>f :Unite vimgrep:
nnoremap <c-p> :<c-u>Unite -buffer-name=files -start-insert file_rec<cr>

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
NeoBundle 'junkblocker/unite-tasklist'
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" TComment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      \ }

" NerdCommenter
NeoBundle 'scrooloose/nerdcommenter'
let g:NERDSpaceDelims=1
" map <leader>; <leader>ci
" map <leader>: <leader>cm
" map <leader>' <leader>cA
" map <leader>" <leader>cs
let g:NERDCustomDelimiters = {
      \ 'htmlyiiprado': { 'left': '<!---', 'right': '--->', 'leftAlt': '<!--', 'rightAlt': '-->' },
      \ 'blade.php': { 'left': '<!--', 'right': '-->', 'leftAlt': '<!--', 'rightAlt': '-->' },
      \ 'less': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' }
      \ }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'bling/vim-airline'
if has('unix')
  " airline 设置
  let g:airline_powerline_fonts=2

  let g:airline_theme='molokai'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = '⮀'
  let g:airline_right_sep = '⮂'
  let g:airline_left_alt_sep = '⮁'
  let g:airline_right_alt_sep = '⮃'
  let g:airline_branch_prefix = '⭠'
  let g:airline_readonly_symbol = '⭤'
  let g:airline_paste_symbol = '∥'
  let g:airline_whitespace_symbol = 'Ξ'
  let g:airline_linecolumn_prefix = '⭡'

  " 显示换行和制表符
  set listchars=eol:¬,tab:>-,nbsp:~
elseif has('win32') || has('win64')
  let g:airline_theme='molokai'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" ColorV
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Rykka/colorv.vim'
" 颜色显示 使用ColorV
let g:colorv_preview_ftype = 'css,html,php,jsp,aspvbs,mason,javascript,htm,less'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NeoComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NeoSnippet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" auto-pairs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'jiangmiao/auto-pairs'
" let g:AutoPairsFlyMode = 1
let g:AutoPairsMapSpace = 0
let g:AutoPairs = {
      \ '(': ')',
      \ '[': ']',
      \ "'": "'",
      \ '"': '"',
      \ '`': '`'}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" wildfire
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'gcmt/wildfire.vim'
let g:wildfire_fuel_map = "<c-cr>"
let g:wildfire_objects = ["i'", 'i"', "i)", "i]", "i}", "ip", "it"]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'scrooloose/syntastic'
if has('win32')
  let g:syntastic_error_symbol = 'x>'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '>>'
  let g:syntastic_style_warning_symbol = 'S>'
else
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_style_error_symbol = 'Sx'
  let g:syntastic_warning_symbol = '⚠'
  let g:syntastic_style_warning_symbol = 'S>'
endif
" Syntastic 语法错误检查
" let g:syntastic_check_on_open = 1
let g:syntastic_php_checkers=['php']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': [],
      \ 'passive_filetypes': ['java', 'less'] }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #######
" #           #    #       ######   #####   #   #  #####   ######
" #           #    #       #          #      # #   #    #  #
" #####       #    #       #####      #       #    #    #  #####
" #           #    #       #          #       #    #####   #
" #           #    #       #          #       #    #       #
" #           #    ######  ######     #       #    #       ######
" FILETYPE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Matchit Html5 Matlab Ahk Date
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
NeoBundleLazy 'davidhalter/jedi-vim', {
      \ 'autoload' : { 'filetypes' : 'python' }}
NeoBundleLazy 'hdima/python-syntax', {
      \ 'autoload' : { 'filetypes' : 'python' }}
NeoBundleLazy 'elzr/vim-json', {
      \ 'autoload' : { 'filetypes' : 'json' }}
NeoBundleLazy 'digitaltoad/vim-jade', {
      \ 'autoload' : { 'filetypes' : 'jade' }}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Java
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gabesoft/vim-java', {
      \ 'autoload' : { 'filetypes' : 'java' }}
" NeoBundleLazy 'VictorDenisov/javacomplete', {
"       \ 'autoload' : { 'filetypes' : 'java' }}
" command! JavaApi setlocal omnifunc=javacomplete#Complete
NeoBundleLazy 'yuratomo/java-api-complete', {
      \ 'autoload' : { 'filetypes' : 'java' }}
NeoBundleLazy 'yuratomo/java-api-javax', {
      \ 'autoload' : { 'filetypes' : 'java' }}

NeoBundleLazy 'yuratomo/java-api-org'
NeoBundleLazy 'yuratomo/java-api-sun'
NeoBundleLazy 'yuratomo/java-api-servlet2.3'
NeoBundleLazy 'yuratomo/java-api-android'
command! JavaApi setlocal omnifunc=javaapi#complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Eclim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" nodejs complete ~jshint~ coffee
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
      \ 'autoload' : { 'filetypes' : 'coffee' }}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Jedi
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'davidhalter/jedi-vim', {
      \ 'autoload' : { 'filetypes' : 'python' }}
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" PhpDocumentor
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vim-scripts/PDV--phpDocumentor-for-Vim', {
NeoBundleLazy 'stephpy/vim-phpdoc', {
      \ 'autoload' : { 'filetypes' : ['php' ,'html', 'xhtml', 'xml', 'htm'] }}
" inoremap <leader>8 <ESC>:call PhpDocSingle()<CR>i
" let g:pdv_cfg_Version = "$id$"
let g:pdv_cfg_Author = "Raidou 徐伟榕 <weirongxuraidou@gmail.com> ".strftime("%Y-%m-%d")
" let g:pdv_cfg_Copyright = "20013-2013 ".g:pdv_cfg_Author
" let g:pdv_cfg_License = ""
nnoremap <leader>8 :call PhpDocSingle()<CR>
vnoremap <leader>8 :call PhpDocRange()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" YiiPradoTemplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/yiiprado.vim', {
      \ 'autoload' : { 'filetypes' : ['htmlyiiprado.html.php'] }}
autocmd BufNewFile,BufRead *.tpl setfiletype htmlyiiprado.html.php
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" breeze
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'gcmt/breeze.vim', {
      \ 'autoload' : {
      \   'filetypes' : ['html', 'jsp', 'xhtml', 'xml',
      \                  'htm', 'php', 'aspvbs', 'mason'] }}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" LaravelBladeTemplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'xsbeats/vim-blade', {
      \ 'autoload' : { 'filetypes' : ['blade'] }}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Less styl Css
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'hail2u/vim-css3-syntax', {
      \ 'autoload' : { 'filetypes' : ['css', 'less'] }}
NeoBundleLazy 'groenewege/vim-less', {
      \ 'autoload' : { 'filetypes' : ['less'] }}
NeoBundleLazy 'wavded/vim-stylus', {
      \ 'autoload' : { 'filetypes' : ['stylus'] }}
autocmd BufNewFile,BufRead *.styl set filetype=stylus
autocmd BufNewFile,BufRead *.stylus set filetype=stylus
" NeoBundleLazy 'weirongxu/vim-less', {
"       \ 'autoload' : { 'filetypes' : ['less'] }}
" " less 自动编译
" let g:less_auto_compile = 0
" let g:less_compile_buffer_key = '<F5>'
" let g:less_compile_option = '-x'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" OmniCppComplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Clang_complete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32')
  NeoBundleLazy 'Rip-Rip/clang_complete'
elseif has('unix')
  NeoBundleLazy 'Rip-Rip/clang_complete', {
        \ 'autoload' : { 'filetypes' : ['cpp', 'c'] }}
  " let g:clang_complete_copen = 1
  let g:clang_complete_auto = 1
  let g:clang_auto_select = 1
  let g:clang_library_path = '/usr/lib/'
  let g:clang_use_library = 1
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" MkdView
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'weirongxu/mkdview.vim', {
      \ 'autoload' : { 'filetypes' : 'markdown' }}
let g:mkdview#css = 'github.css'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #######
"    #      ####    ####   #        ####
"    #     #    #  #    #  #       #
"    #     #    #  #    #  #        ####
"    #     #    #  #    #  #            #
"    #     #    #  #    #  #       #    #
"    #      ####    ####   ######   ####
" TOOLS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""
" Hexman DrawIt VisIncr Eunuch
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'vim-scripts/hexman.vim', {
      \ 'autoload' : { 'mappings' : '<Leader>h' }}
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
NeoBundleLazy 'mattn/emoji-vim', {
      \ 'autoload' : {
      \   'commands' : ['Emoji']
      \ }, 'type' : 'nosync' }
NeoBundleLazy 'thinca/vim-ref', {
      \ 'autoload' : {
      \   'commands' : ['Ref']
      \ }}
NeoBundleLazy 'tpope/vim-dispatch', {
      \ 'autoload' : {
      \   'commands' : ['Make', 'Copen', 'Dispatch', 'FocusDispatch', 'Start']
      \ }}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" vookmark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'starleoda/vim-vookmark', {
      \ 'autoload' : {
      \   'commands' : [ 'VmkToggle', 'VmkNext', 'VmkPrev', 'VmkClear',
      \                  'VmkSave', 'VmkLoad', 'VmkList', 'VmkRefresh',
      \                  'VmkFactoryReset' ]
      \ }}
let g:vookmark_mapkeys=0
map <leader><space> :VmkToggle<cr>
map <Leader><space>n :VmkNext<cr>
map <leader><space>p :VmkPrev<cr>
map <leader><space>N :VmkPrev<cr>
map <leader><space>c :VmkClear<cr>

map <leader><space>l :VmkList<cr>
map <leader><space>r :VmkRefresh<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Gundo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     'GundoToggle', 'GundoHide', 'GundoRendGraph', 'GundoShow'
      \   ]
      \ }}
command! Gundo GundoToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'vim-scripts/Align', {
      \ 'autoload' : {
      \   'commands' : ['Align', 'AlignCtrl', 'AlignPush', 'AlignPop']
      \ }}
vmap <CR> :<c-u>call <SID>Align_input()<CR>
function! s:Align_input()
  let align = input("Align: ")
  execute "'<,'>Align ".align
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Sunday
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'mattn/vim-sunday', {
      \ 'autoload' : {
      \   'mappings' : ['<c-a>', '<c-x>']
      \ }}
let g:sunday_pairs = [
    \   ['extends', 'implements'],
    \   ['require', 'require_once', 'include', 'include_once'],
    \ ]
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" NerdTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose版本在win下切换磁盘会有问题
" NeoBundleLazy 'mixvin/nerdtree', {
NeoBundleLazy 'scrooloose/nerdtree', {
      \ 'autoload' : {
      \   'commands' : ['NERDTree', 'NERDTreeFromBookmark',
      \                 'NERDTreeToggle', 'NERDTreeMirror',
      \                 'NERDTreeClose', 'NERDTreeFind',
      \                 'NERDTreeCWD']
      \ }}
map gn :NERDTreeToggle<cr>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" VimWiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundleLazy 'vimwiki/vimwiki', 'dev', { " 用dev版的todo列表没有样式了
NeoBundleLazy 'vimwiki/vimwiki', {
      \ 'autoload' : {
      \   'filetypes' : 'vimwiki',
      \   'commands' : ['VimwikiIndex', 'VimwikiTabIndex', 'VimwikiUISelect',
      \                 'VimwikiDiaryIndex', 'VimwikiMakeDiaryNote', 'VimwikiTabMakeDiaryNote',
      \                 'Calendar', 'CalendarH'],
      \   'mappings' : ['<Leader>ww', '<Plug>VimwikiIndex', '<Leader>wt',
      \                 '<Plug>VimwikiTabIndex', '<Leader>ws', '<Plug>VimwikiUISelect',
      \                 '<Leader>wi', '<Plug>VimwikiDiaryIndex', '<Leader>w<Leader>w',
      \                 '<Plug>VimwikiMakeDiaryNote', '<Leader>w<Leader>t', '<Plug>VimwikiTabMakeDiaryNote',
      \                 '<LocalLeader>cal', '<LocalLeader>caL']
      \ }}
execute "source ".$MYVIMFILES."/vimwiki.vim"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Calendar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'itchyny/calendar.vim' " XXX 以后再说
let g:calendar_google_task = 1
NeoBundleLazy 'mattn/calendar-vim', {
      \ 'autoload' : {
      \   'commands' : ['Calendar', 'CalendarH', 'CalendarT'],
      \   'mappings' : ['<LocalLeader>cal', '<LocalLeader>caL']
      \ }}
map gC :Calendar<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" Indent-Guides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'nathanaelkane/vim-indent-guides', {
      \ 'autoload' : {
      \   'commands' : ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
      \   'mappings' : ['<Plug>IndentGuidesToggle', '<Plug>IndentGuidesEnable', '<Plug>IndentGuidesDisable']
      \ },
      \ 'gui': 1 }
" 设置对齐线
let g:indent_guides_guide_size = 1
nmap <silent> gL <Plug>IndentGuidesToggle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""
" EasyMotion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Lokaltog/vim-easymotion', {
      \ 'autoload' : {
      \   'mappings' : ['<space>f', '<space>F', '<space>t', '<space>T',
      \                 '<space>w', '<space>W', '<space>b', '<space>B',
      \                 '<space>e', '<space>E', '<space>ge', '<space>gE',
      \                 '<space>j', '<space>k', '<space>n', '<space>N',
      \                 '<space>s']
      \}}
let g:EasyMotion_leader_key = '<space>'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" Recover
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'tpope/vim-afterimage' " 用vim来编辑图片。It's crazy!
" NeoBundle 'vim-scripts/mru.vim' " 用ctrlp代替
" NeoBundle 'terryma/vim-multiple-cursors' " 这不是人类能驾驭的
" NeoBundle 'Rykka/galaxy.vim' " 还用不上
" NeoBundle 'sukima/xmledit' " 好像没什么用
" NeoBundle 'vim-scripts/jsbeautify' " jsff 它的效率不好
" NeoBundle 'vim-scripts/colorizer' " 用colorv代替
" NeoBundle 'vim-scripts/taglist.vim' " 用tagbar代替
" NeoBundle 'vim-scripts/Color-Sampler-Pack' " 没怎么用
" NeoBundleLazy 'jnwhiteh/vim-golang' " go语言
" NeoBundleLazy 'jceb/vim-orgmode' " vimwiki伤不起
" NeoBundle 'Shougo/vimshell.vim' " 另外再用一个shell也太占空间了
" NeoBundleLazy 'vim-scripts/utl.vim' " 这个打开链接不好用
" NeoBundle 'millermedeiros/vim-statline', {'base' : $MYBUNDLEDIR.'-win32'} " 还是用airline吧
" NeoBundle 'Lokaltog/powerline', {'base': $MYBUNDLEDIR.'-win32'} " 因为有airline
" NeoBundle 'kien/ctrlp.vim' " 被unite折服了。。。
" NeoBundle 'Townk/vim-autoclose' " ESC是要更新buffer，这样和neocomplete冲突了。
" NeoBundle 'Raimondi/delimitMate' " 还是jiangmiao/auto-pairs好使
" NeoBundle 'junegunn/vim-easy-align' " 我还是用Align吧，模拟easy-align
" NeoBundle 'szw/vim-ctrlspace' " 这个确实不错，但是Shougo的unite。。。
" NeoBundle 'itchyny/lightline.vim' " 这个vimer强势出击呀？不过配制比airline麻烦。
" NeoBundle 'itchyny/vim-cmdline-ranges'
" NeoBundle 'itchyny/thumbnail.vim' " 切换窗口，用的不多
" NeoBundle 'yuratomo/gmail.vim' " 太疯狂。
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe' " wait
" NeoBundle 'FredKSchott/CoVim' " 协作编辑wait
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其它插件设置
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" 打开 javascript 对 dom、html 和 css 的支持
let javascript_enable_domhtmlcss = 1

" 设置 javascriptlint
autocmd FileType javascript set makeprg=jsl\ -process\ %

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

" think php tpl
autocmd BufNewFile,BufRead *.html setfiletype htmlthphp.html
