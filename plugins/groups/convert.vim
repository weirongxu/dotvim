PluginAdd 'salsifis/vim-transpose', #{ on_cmd: [
      \ 'Transpose',
      \ 'TransposeWords',
      \ 'TransposeTab',
      \ 'TransposeCSV',
      \ 'TransposeInteractive',
      \ 'TransposeIndentToggle',
      \ ]}

" PluginAdd machakann/vim-swap
"   'on_map': ['g<', 'g>', 'gs']

PluginAdd 'AndrewRadev/sideways.vim'
nmap gh <Cmd>SidewaysLeft<CR>
nmap gl <Cmd>SidewaysRight<CR>
omap a, <Plug>SidewaysArgumentTextobjA
xmap a, <Plug>SidewaysArgumentTextobjA
omap i, <Plug>SidewaysArgumentTextobjI
xmap i, <Plug>SidewaysArgumentTextobjI
autocmd FileType vue let b:sideways_definitions = [
  \   {
  \     'start':                   '<\k\+\_s\+',
  \     'end':                     '\s*/\?>',
  \     'delimited_by_whitespace': 1,
  \     'brackets':                ['"''', '"'''],
  \   },
  \   {
  \     'start':     '\k:\s*',
  \     'end':       ';',
  \     'delimiter': '\s',
  \     'brackets':  ['(''"', ')''"'],
  \   },
  \   {
  \     'start':     '{\_s*',
  \     'end':       ';\=\_s*}',
  \     'delimiter': ';\_s*',
  \     'brackets':  ['(''"', ')''"'],
  \   },
  \ ]

PluginAdd 'AndrewRadev/switch.vim'
function! g:plugin_hooks[SourcedHook()]()
  if exists('g:switch_builtins')
    let g:switch_builtins.ruby_hash_style =
    \ {
    \   '"\(\k\+\%([?!]\)\=\)"\s*=>':   '''\1'' =>',
    \   '''\(\k\+\%([?!]\)\=\)''\s*=>': '\1:',
    \   '\<\(\k\+\%([?!]\)\=\):':       ':\1 =>',
    \   ':\(\k\+\%([?!]\)\=\)\s*=>':    '"\1" =>',
    \ }
    let g:switch_builtins.ruby_string =
    \ {
    \   '"\(\k\+\%([?!]\)\=\)"\@>\%(\s*=>\)\@!':   '''\1''',
    \   '''\(\k\+\%([?!]\)\=\)''\@>\%(\s*=>\)\@!': ':\1',
    \   ':\(\k\+\%([?!]\)\=\)\@>\%(\s*=>\)\@!':    '"\1"\2',
    \ }
  endif
endfunction

PluginAdd 'kana/vim-smartchr'
autocmd FileType c,cpp,perl,php inoremap <buffer> <expr> -
      \ smartchr#one_of('-', '->', '--')

PluginAdd 'FooSoft/vim-argwrap'
function! NoTailArgwrap()
  let b:argwrap_tail_comma_braces = ''
  ArgWrap
  unlet b:argwrap_tail_comma_braces
endfunction

function! TailArgwrap(braces)
  let b:argwrap_tail_comma_braces = a:braces
  ArgWrap
  unlet b:argwrap_tail_comma_braces
endfunction

function! Argwrap()
  if &filetype == 'ruby'
    call TailArgwrap('{[')
  elseif &filetype == 'python'
    call TailArgwrap('{[(')
  else
    ArgWrap
  endif
endfunction

nmap <silent> <Leader>w <Cmd>call Argwrap()<CR>
nmap <silent> <Leader>W <Cmd>call NoTailArgwrap()<CR>
let g:argwrap_tail_comma_braces = '{['

PluginAdd 'dhruvasagar/vim-table-mode', #{ on_map: '<Leader><Leader>tm' }
let g:table_mode_map_prefix = '<Leader><Leader>t'

PluginAdd 'junegunn/vim-easy-align', #{
      \ on_map: ['<Plug>(EasyAlign)', '<Plug>(LiveEasyAlign)'],
      \ on_cmd: ['EasyAlign', 'LiveEasyAlign'],
      \ }
vmap <Leader>al <Cmd>LiveEasyAlign<CR>

PluginAdd 'chiedo/vim-case-convert', #{
      \ on_cmd: [
      \   'CamelToHyphen',
      \   'CamelToSnake',
      \   'HyphenToCamel',
      \   'HyphenToSnake',
      \   'SnakeToCamel',
      \   'SnakeToHyphen',
      \   'CamelToHyphenAll',
      \   'CamelToSnakeAll',
      \   'HyphenToCamelAll',
      \   'HyphenToSnakeAll',
      \   'SnakeToCamelAll',
      \   'SnakeToHyphenAll',
      \ ]}
function! g:plugin_hooks[SourcedHook()]()
  call AddCommand('case.CamelToHyphen', 'CamelToHyphen')
  call AddCommand('case.CamelToSnake',  'CamelToSnake')
  call AddCommand('case.HyphenToCamel', 'HyphenToCamel')
  call AddCommand('case.HyphenToSnake', 'HyphenToSnake')
  call AddCommand('case.SnakeToCamel',  'SnakeToCamel')
  call AddCommand('case.SnakeToHyphen', 'SnakeToHyphen')
endfunction

PluginAdd 'tpope/vim-abolish'
