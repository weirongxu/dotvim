let $VIMCONFIG = $MY_VIMFILES
let g:coc_global_extensions = [
      \ 'coc-explorer',
      \ 'coc-tsserver',
      \ 'coc-tslint-plugin',
      \ 'coc-vimlsp',
      \ 'coc-lists',
      \ 'coc-vetur',
      \ 'coc-json',
      \ 'coc-css',
      \ 'coc-html',
      \ 'coc-yaml',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-snippets',
      \ 'coc-tag',
      \ 'coc-dictionary',
      \ 'coc-word',
      \ 'coc-syntax',
      \ 'coc-jest',
      \ 'coc-emoji',
      \ 'coc-emmet',
      \ 'coc-highlight',
      \ 'coc-phpls',
      \ 'coc-solargraph',
      \ 'coc-vimtex',
      \ 'coc-calc',
      \ 'coc-pairs',
      \ 'coc-git',
      \ 'coc-import-cost',
      \ 'coc-marketplace',
      \ 'coc-go',
      \ 'coc-svg',
      \ 'coc-docker',
      \ 'coc-rust-analyzer',
      \ ]

inoremap <silent><expr> <C-l> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

nmap gd <Plug>(coc-definition)
nmap gy <Plug>(coc-type-definition)
nmap gi <Plug>(coc-implementation)
nmap gr <Plug>(coc-references)
nmap [d <Plug>(coc-diagnostic-prev)
nmap ]d <Plug>(coc-diagnostic-next)
nmap [D <Plug>(coc-diagnostic-prev-error)
nmap ]D <Plug>(coc-diagnostic-next-error)
if has('nvim')
  nmap <Leader>rn <Plug>(coc-floatinput-rename)
else
  nmap <Leader>rn <Plug>(coc-rename)
endif
nmap <Leader>: <Plug>(coc-floatinput-command)
nmap <Leader>c: <Plug>(coc-floatinput-coc-command)
nmap <Leader>rf <Plug>(coc-refactor)
nnoremap <Leader><CR> :CocAction<CR>
vnoremap <Leader><CR> :CocAction<CR>
nmap <Leader>oo <Plug>(coc-openlink)
nmap <Leader>fx <Plug>(coc-fix-current)
nnoremap <Leader>fi :CocCommand editor.action.organizeImport<CR>
nmap <Leader>ff <Plug>(coc-format)
vmap <Leader>ff <Plug>(coc-format-selected)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
autocmd ColorScheme *
      \ hi CocHighlightText ctermbg=242 guibg=#404040
      \ | hi CocErrorHighlight guibg=#802020
      \ | hi CocWarningHighlight guibg=#806022
      \ | hi CocInfoHighlight guibg=#806022
      \ | hi CocHintHighlight guibg=#224290
autocmd CursorHold * silent call CocActionAsync('highlight')

nnoremap <Leader>lr :CocListResume<CR>
nnoremap <Leader>ll :CocList<CR>
nnoremap <Leader>lb :CocList --normal buffers<CR>
nnoremap <Leader>fg :CocList -I grep<CR>
nnoremap <Leader>fG :CocList -I grep -regex <CR>
nnoremap <Leader>fcg :exe 'CocList --normal -I --input='.expand('<cword>').' grep'<CR>
nnoremap <Leader>lc :CocList commands<CR>
nnoremap <Leader>lC :CocList vimcommands<CR>
nnoremap <Leader>lCh :CocList cmdhistory<CR>
nnoremap <Leader>l/ :CocList searchhistory<CR>
nnoremap <Leader>lo :CocList outline<CR>
nnoremap <Leader>le :CocList extensions<CR>
nnoremap <Leader>lmp :CocList marketplace<CR>
nnoremap <Leader>ld :CocList diagnostics<CR>
nnoremap <Leader>ls :CocList services<CR>

nnoremap <Leader>[[ :CocPrev<CR>
nnoremap <Leader>]] :CocNext<CR>

" ctrl-p
nnoremap <C-p> :CocList files<CR>

" actions
nnoremap <Leader>ccp :call CocAction("pickColor")<CR>
nnoremap <Leader>ccP :call CocAction("colorPresentation")<CR>

" snippets
inoremap <silent><expr> <TAB>
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ "\<TAB>"
vmap <Tab> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
xmap <leader>x  <Plug>(coc-convert-snippet)

" coc-git
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap <Leader>gi <Plug>(coc-git-chunkinfo)
nmap <Leader>ggc <Plug>(coc-git-commit)
nnoremap <Leader>g< :CocCommand git.chunkStage<CR>
nnoremap <Leader>g= :CocCommand git.chunkUndo<CR>
nnoremap <Leader>lg :CocList gstatus<CR>
omap igc <Plug>(coc-git-chunk-inner)
xmap igc <Plug>(coc-git-chunk-inner)
omap agc <Plug>(coc-git-chunk-outer)
xmap agc <Plug>(coc-git-chunk-outer)

" coc-calc
nmap <Leader>cc <Plug>(coc-calc-result-append)
nmap <Leader>cC <Plug>(coc-calc-result-replace)

" coc-explorer
let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': $MY_VIMFILES,
\      'reveal': $MY_PLUGINS,
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\      'position': 'tab',
\      'quit-on-open': v:true,
\   },
\   'floating': {
\      'position': 'floating',
\      'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\      'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'right-center',
\      'floating-width': 50,
\      'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\   'git': {
\     'sources': [{'name': 'git', 'expand': v:true}]
\   },
\ }
nnoremap <Leader>ee :CocCommand explorer<CR>
nnoremap <Leader>ef :CocCommand explorer --preset floating<CR>
nnoremap <Leader>et :CocCommand explorer --preset tab<CR>
nnoremap <Leader>eh :CocCommand explorer --preset floatingLeftside<CR>
nnoremap <Leader>el :CocCommand explorer --preset floatingRightside<CR>
nnoremap <Leader>ev :CocCommand explorer --preset .vim<CR>
nnoremap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nnoremap <Leader>eb :CocCommand explorer --preset buffer<CR>
nnoremap <Leader>eg :CocCommand explorer --preset git<CR>
nnoremap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

autocmd ColorScheme *
      \ hi CocHelperNormalFloatBorder guifg=#dddddd guibg=#373B34
      \ | hi CocHelperNormalFloat guibg=#373B34
      \ | hi CocExplorerNormalFloatBorder guifg=#dddddd guibg=#373B34
      \ | hi CocExplorerNormalFloat guibg=#373B34

function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute substitute(a:cmd, '\V%cwd', dir, 'g')
endfunction

function! s:init_explorer()
  " set winblend=10

  " Integration with other plugins

  " CocList
  nnoremap <buffer> <Leader>fg :call <SID>exec_cur_dir('CocList -I grep')<CR>
  nnoremap <buffer> <Leader>fG :call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
  nnoremap <buffer> <C-p> :call <SID>exec_cur_dir('CocList files')<CR>

  " vim-floaterm
  nmap <buffer> <Leader>ft :call <SID>exec_cur_dir('FloatermToggle --wintype=floating')<CR>
endfunction

function! s:enter_explorer()
  if &filetype == 'coc-explorer'
    " statusline
    setl statusline=coc-explorer
  endif
endfunction

augroup CocExplorerCustom
  autocmd!
  autocmd BufEnter * call <SID>enter_explorer()
  autocmd FileType coc-explorer call <SID>init_explorer()
augroup END

if has('nvim')
  function! s:is_float(winnr)
    let winid = win_getid(a:winnr)
    return !empty(nvim_win_get_config(winid)['relative'])
  endfunction

  function! s:quit_pre()
    let cur_nr = winnr()
    if s:is_float(cur_nr)
      return
    endif
    let last_nr = winnr('$')
    for nr in range(last_nr, 1, -1)
      if s:is_float(nr)
        continue
      endif
      if nr == 1
        only
      else
        break
      endif
    endfor
  endfunction

  autocmd QuitPre * call <SID>quit_pre()
endif
