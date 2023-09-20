PluginAdd 'jaxbot/semantic-highlight.vim', #{on_cmd: 'SemanticHighlightToggle'}
function! g:plugin_hooks[SourcedHook()]()
  call AddCommand('SemanticHighlightToggle', 'SemanticHighlightToggle')
endfunction

PluginAdd 'tpope/vim-eunuch', #{
      \ on_cmd: [
      \   'Unlink',
      \   'Remove',
      \   'Move',
      \   'Rename',
      \   'Chmod',
      \   'Find',
      \   'Locate',
      \   'SudoWrite',
      \   'W',
      \ ]}

PluginAdd 'lambdalisue/suda.vim'
command! SudaRead  edit  suda://%
command! SudaWrite write suda://%

PluginAdd 'vim-scripts/DrawIt', #{on_cmd: ['DIstart', 'DIsngl', 'DIdbl', 'DIstop', 'DrawIt']}

PluginAdd 'gyim/vim-boxdraw'

PluginAdd 'vim-scripts/VisIncr', #{
      \ on_cmd: [
      \   'I',
      \   'II',
      \   'IB',
      \   'IIB',
      \   'IO',
      \   'IIO',
      \   'IX',
      \   'IIX',
      \   'IYMD',
      \   'IMDY',
      \   'IDMY',
      \   'IA',
      \   'ID',
      \   'IM',
      \   'IPOW',
      \   'IIPOW',
      \ ]}

PluginAdd 'KabbAmine/vCoolor.vim'
let g:vcoolor_disable_mappings = 1
map <Leader>vc <Cmd>VCoolor<CR>

PluginAdd 'januswel/sweepbuf.vim', #{on_cmd: 'SweepBuffers'}

PluginAdd 'szw/vim-maximizer', #{on_cmd: 'MaximizerToggle'}
map <Leader>m <Cmd>MaximizerToggle<CR>

PluginAdd 'Shougo/vinarise.vim', #{
      \ on_cmd: [
      \   'Vinarise',
      \   'VinariseScript2Hex',
      \   'VinariseHex2Script',
      \   'VinarisePluginDump',
      \   'VinarisePluginViewBitmapView',
      \ ]}

PluginAdd 'diepm/vim-rest-console', #{on_ft: 'rest'}
function! OpenRest()
  tabnew Rest
  setf rest
  setlocal bufhidden=hide
  setlocal buftype=nofile
  setlocal nobuflisted
  if has('cursorbind')
    setlocal nocursorbind
  endif
  setlocal noswapfile
  setlocal nospell
  setlocal noreadonly
  nmap <buffer> <CR> <c-j>

  call setline(1, [
        \ 'http://localhost',
        \ 'Content-Type: application/json; charset=utf-8',
        \ 'POST /',
        \ '{',
        \ '  "key": "value"',
        \ '}',
        \])
endfunction
command! Rest call OpenRest()

PluginAdd 'AndrewRadev/bufferize.vim'

PluginAdd 'kristijanhusak/vim-carbon-now-sh', #{on_cmd: 'CarbonNowSh'}

" PluginAdd 'echuraev/translate-shell.vim'
" let g:trans_default_direction = ':zh-CN'
" let g:trans_directions_list = [
"      \['', 'zh-CN'],
"      \['', 'ja'],
"      \['', 'en'],
"      \['', 'zh-TW'],
"      \]
" map <Leader>tr <Cmd>Trans<CR>
" map <Leader>ts <Cmd>TransSelectDirection<CR>
" map <Leader>ti <Cmd>TransInteractive<CR>
" map <Leader>th <Cmd>TransOpenHistoryWindow<CR>

" PluginAdd 'translate-shell-speak', #{inner: 1}
" map <Leader>tp <Cmd>call translate_shell_speak#speak_cursor_work()<CR>
" vmap <Leader>tp <Cmd>call translate_shell_speak#speak_visual()<CR>

PluginAdd 'convert-tmp', #{inner: 1}

PluginAdd 'rand_password', #{inner: 1}
function! g:plugin_hooks[SourcedHook()]()
  command! RandomPasswordReg call setreg('"', RandPasswordInput())
  command! RandomWordsPasswordReg call setreg('"', RandPasswordInputOnlyWord())
  call AddCommand('random.password2reg' , 'RandomPasswordReg')
  call AddCommand('random.words-password2reg' , 'RandomWordsPasswordReg')
endfunction

PluginAdd 'thinca/vim-partedit'

PluginAdd 'voldikss/vim-floaterm'
nmap <Leader>f1 <Cmd>FloatermToggle --wintype=floating win-1<CR>
nmap <Leader>f2 <Cmd>FloatermToggle --wintype=floating win-2<CR>
nmap <Leader>f3 <Cmd>FloatermToggle --wintype=floating win-3<CR>
nmap <Leader>f4 <Cmd>FloatermToggle --wintype=floating win-4<CR>
nmap <Leader>f5 <Cmd>FloatermToggle --wintype=floating win-5<CR>
nmap <Leader>f6 <Cmd>FloatermToggle --wintype=floating win-6<CR>
nmap <Leader>f7 <Cmd>FloatermToggle --wintype=floating win-7<CR>
nmap <Leader>f8 <Cmd>FloatermToggle --wintype=floating win-8<CR>
nmap <Leader>f9 <Cmd>FloatermToggle --wintype=floating win-9<CR>
nmap <Leader>ft <Cmd>FloatermNew --wintype=floating<CR>
