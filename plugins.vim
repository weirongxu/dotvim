"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('vim_starting')
  let &runtimepath = &runtimepath.','.$MYBUNDLEDIR.'/neobundle.vim'
endif

call neobundle#rc($MYBUNDLEDIR)
call neobundle#local($MYBUNDLEDIR.'-common', {})

" if g:env#unix
  " call neobundle#local($MYBUNDLEDIR.'-unix', {})
" elseif g:env#win
  " call neobundle#local($MYBUNDLEDIR.'-win32', {})
" endif

NeoBundle 'Shougo/neobundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MUST
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'mbbill/fencview'
NeoBundle 'dimasg/vim-mark'
NeoBundle 'tpope/vim-surround'
NeoBundle 'nacitar/a.vim'
NeoBundle 'wellle/targets.vim'
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
Include editorconfig-vim
NeoBundle 'weirongxu/context_filetype.vim'
NeoBundle 'osyo-manga/vim-precious'
Include context_filetype
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

NeoBundle 'FredKSchott/CoVim'
" NeoBundle 'rbtnn/rabbit-ui.vim'
""""""""""""""""""""""""""""""
" Temp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Translate
" neobundle 'Rykka/trans.vim'
" NeoBundle 'bolasblack/gtrans.vim'
" NeoBundle 'jiazhoulvke/googletranslate'
" NeoBundle 'ianva/vim-youdao-translater'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" test
NeoBundle 'junegunn/vader.vim'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


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
call textobj#user#plugin('php', {
\   'code': {
\     'pattern': ['<?php\>', '?>'],
\     'select-a': 'aP',
\     'select-i': 'iP',
\   },
\ })
call textobj#user#plugin('webscript', {
\   'code': {
\     'pattern': ['<?', '?>'],
\     'select-a': 'a?',
\     'select-i': 'i?',
\   },
\ })
NeoBundle 'kana/vim-textobj-indent'
NeoBundle 'kana/vim-textobj-entire'
NeoBundle 'kana/vim-textobj-line'
NeoBundle 'rhysd/vim-textobj-continuous-line'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'gcmt/wildfire.vim'
" if g:env#gui
"   map <C-CR> <Plug>(wildfire-fuel)
" else
"   map <NL> <Plug>(wildfire-fuel)
" endif
" let g:wildfire_objects = [
"       \ "i'", "a'",
"       \ 'i"', 'a"',
"       \ "i)", "a)",
"       \ "i]", "a]",
"       \ "i}", "a}",
"       \ "ii",
"       \ "il",
"       \ "ip",
"       \ "it"
"       \ ]
NeoBundle 'terryma/vim-expand-region'
let g:expand_region_text_objects = {
      \ 'iw'  : 0,
      \ 'iW'  : 0,
      \ 'i"'  : 0, 'a"'  : 0,
      \ 'i''' : 0, 'a''' : 0,
      \ 'i]'  : 1, 'a]'  : 1,
      \ 'i)'  : 1, 'a)'  : 1,
      \ 'i}'  : 1, 'a}'  : 1,
      \ 'i>'  : 1, 'a>'  : 1,
      \ 'it'  : 1, 'at'  : 1,
      \ 'il'  : 0,
      \ 'ii'  : 0,
      \ 'ib'  : 1,
      \ 'iB'  : 1,
      \ 'ip'  : 0,
      \ 'ie'  : 0,
      \ }
call expand_region#custom_text_objects('php', {
      \   'iP' : 0,
      \   'aP' : 0,
      \ })
if g:env#gui
  map <C-CR> <Plug>(expand_region_expand)
else
  map <NL> <Plug>(expand_region_expand)
endif
vmap <BS> <Plug>(expand_region_shrink)


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
      \ 'autoload' : {
      \   'commands' : ['Gitv']
      \ }}
if g:env#unix
  NeoBundle 'airblade/vim-gitgutter'
  let g:gitgutter_enabled = 1
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0
endif
" NeoBundle 'mhinz/vim-signify'


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
""""""""""""""""""""""""""""""
NeoBundleLazy 'ujihisa/unite-colorscheme'
NeoBundleLazy 'Shougo/unite-outline'
NeoBundle 'Shougo/junkfile.vim'
""""""""""""""""""""""""""""""
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }


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
NeoBundle 'itchyny/lightline.vim'
let g:lightline = {
      \   'colorscheme': 'jellybeans',
      \   'component': {
      \     'readonly': '%{&filetype=="help"?"":&readonly?"RO":""}',
      \     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \   }
      \ }
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
"       \ 'autoload' : {
"       \   'commands' : ['IndentGuidesToggle', 'IndentGuidesEnable', 'IndentGuidesDisable'],
"       \   'mappings' : ['<Plug>IndentGuidesToggle', '<Plug>IndentGuidesEnable', '<Plug>IndentGuidesDisable']
"       \ },
"       \ 'gui': 1 }
" let g:indent_guides_guide_size = 1
" nmap <silent> gL <Plug>IndentGuidesToggle


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundle 'Rykka/colorv.vim'
let g:colorv_preview_ftype = 'css,html,php,jsp,aspvbs,mason,javascript,htm,less,stylus'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'Valloric/YouCompleteMe'
if has('lua')
  NeoBundle 'Shougo/neocomplete.vim'
  NeoBundleLazy 'Shougo/neocomplcache.vim'
  Include neocomplete
else
  NeoBundle 'Shougo/neocomplcache.vim'
  NeoBundleLazy 'Shougo/neocomplete.vim'
  Include neocomplcache
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
" command Snip NeoSnippetEdit -split -vertical -runtime
command! Snip NeoSnippetEdit -split -vertical


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NeoBundle 'osyo-manga/shabadou.vim'
" NeoBundle 'jceb/vim-hier'
" NeoBundle 'dannyob/quickfixstatus'
" NeoBundle 'osyo-manga/vim-watchdogs'
" let g:watchdogs_check_BufWritePost_enable = 1

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
map <Leader><space> :up<CR>:SyntasticCheck<CR>
      " \ 'mode': 'active',
let g:syntastic_mode_map = {
      \   'mode': 'passive',
      \   'active_filetypes': [],
      \   'passive_filetypes': ['java', 'less']
      \ }




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FILETYPE
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
" NeoBundleLazy 'tpope/vim-speeddating', {
"       \ 'autoload' : { 'filetypes' : ['org', 'vimwiki'] }}
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
NeoBundleLazy 'plasticboy/vim-markdown', {
      \ 'autoload' : { 'filetypes' : ['markdown'] }}
let g:vim_markdown_initial_foldlevel=99
NeoBundle 'maksimr/vim-jsbeautify'
NeoBundle 'briancollins/vim-jst'


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
" if g:env#unix
"   NeoBundleLazy 'davidhalter/jedi-vim', {
"         \ 'autoload' : { 'filetypes' : 'python' }}
"   let g:jedi#popup_select_first = 0
"   let g:jedi#popup_on_dot = 0
"   let g:jedi#auto_close_doc = 0
"   let g:jedi#show_call_signatures = 0
" endif


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
NeoBundleLazy 'weirongxu/yiiprado.vim', {
      \ 'autoload' : { 'filetypes' : ['yiiprado'] }}
autocmd BufNewFile,BufRead *.tpl setfiletype yiiprado


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
NeoBundleLazy 'xsbeats/vim-blade', {
      \ 'autoload' : { 'filetypes' : ['blade'] }}


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
NeoBundleLazy 'osyo-manga/vim-marching', {
        \ 'autoload' : { 'filetypes' : ['cpp', 'c'] }}
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
"         \ 'autoload' : { 'filetypes' : ['cpp', 'c'] }}
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
NeoBundleLazy 'weirongxu/mkdview.vim', {
      \ 'autoload' : { 'filetypes' : 'markdown' }}
let g:mkdview#css = 'github.css'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TOOLS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'Shougo/vinarise.vim', {
      \ 'autoload' : {
      \   'commands' : ['Vinarise', 'VinariseScript2Hex', 'VinariseHex2Script',
      \                 'VinarisePluginDump', 'VinarisePluginViewBitmapView']
      \ }}
NeoBundleLazy 'dhruvasagar/vim-table-mode', {
      \ 'autoload' : {
      \   'mappings' : ['<Leader>t']
      \ }}
NeoBundleLazy 'jaxbot/semantic-highlight.vim', {
      \ 'autoload' : {
      \   'commands' : ['SemanticHighlightToggle']
      \ }}
nnoremap <Leader>s :SemanticHighlightToggle<cr>
NeoBundleLazy 'osyo-manga/vim-over', {
      \ 'autoload' : {
      \   'commands' : ['OverCommandLine']
      \ }}
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
NeoBundleLazy 'AndrewRadev/splitjoin.vim', {
      \ 'autoload': {
      \   'mappings': ['gS', 'gJ']
      \ }}
NeoBundle 'mattn/webapi-vim'
NeoBundleLazy 'mattn/gist-vim', {
      \ 'autoload': { 'commands': ['Gist'] }}
let g:gist_token_file = expand('~/.record/github-token')

NeoBundleLazy 'jaxbot/github-issues.vim', {
      \ 'autoload': {
      \   'commands': ['Gissues', 'Giadd', 'Giedit', 'Giupdate', 'Gmiles']
      \ }}
let github_token_file = g:gist_token_file
if filereadable(github_token_file)
  let g:github_access_token = strpart(join(readfile(github_token_file), ""), 6)
endif


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
NeoBundleLazy 'xieyu/pyclewn', {
      \ 'autoload' : {
      \   'commands' : [ 'Pyclewn' ]
      \ }}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
NeoBundleLazy 'sjl/gundo.vim', {
      \ 'autoload' : {
      \   'commands' : [
      \     'GundoToggle', 'GundoHide', 'GundoRendGraph', 'GundoShow'
      \   ]
      \ }}
command! Gundo GundoToggle


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
NeoBundleLazy 'majutsushi/tagbar', {
      \ 'autoload' : {
      \   'commands' : ['TagbarOpen', 'TagbarClose', 'TagbarToggle', 'Tagbar',
      \                 'TagbarOpenAutoClose', 'TagbarTogglePause',
      \                 'TagbarSetFoldlevel', 'TagbarShowTag',
      \                 'TagbarCurrentTag', 'TagbarGetTypeConfig',
      \                 'TagbarDebug', 'TagbarDebugEnd']
      \ }}
map gl :TagbarToggle<CR>
Include tagbar
let g:tagbar_show_linenumbers = 1


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
let g:vimfiler_ignore_pattern = '\%(^\.\|^.DS_Store%\|.*\.pyc\)'
let g:vimfiler_buf = 'VimFilerBufferDir -explorer -auto-cd -split'
let g:vimfiler_cmd = 'VimFiler -explorer -auto-cd -split'
execute 'map <silent> gn :' . g:vimfiler_buf .'<CR>'
map gc :edit $MYVIMRC<CR>
execute 'map <silent> gp :' . g:vimfiler_cmd . ' ' . $MYVIMFILES . '<CR>'
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
Include vimwiki


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
NeoBundleLazy 'Shougo/vimshell.vim', {
      \ 'autoload' : {
      \   'commands' : ['VimShell', 'VimShellCreate', 'VimShellTab', 'VimShellPop',
      \                 'VimShellCurrentDir', 'VimShellBufferDir', 'VimShellExecute',
      \                 'VimShellInteractive', 'VimShellTerminal', 'VimShellSendString',
      \                 'VimShellSendBuffer']
      \ }}


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
       \   'mappings' : ['<Plug>(easymotion-', 's']
       \}}
let g:EasyMotion_leader_key = 's'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
" nmap sS <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
nmap sl <Plug>(easymotion-sl)
""""""""""""""""""""""""""""""
NeoBundle 'saihoooooooo/glowshi-ft.vim'
NeoBundleLazy 'haya14busa/incsearch.vim', {
      \ 'autoload' : {
      \   'mappings' : ['<Plug>(incsearch-']
      \ }}
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
" NeoBundle 'Valloric/YouCompleteMe' " wait
""""""""""""""""""""""""""""""
" Game
" NeoBundle 'rbtnn/puyo.vim'
" NeoBundle 'rbtnn/mario.vim'
" NeoBundle 'rbtnn/vimconsole.vim'
" NeoBundle 'rbtnn/game_engine.vim'
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
let g:vimim_map='no-search'
" imap <c-c> <c-_>

Include transformer
