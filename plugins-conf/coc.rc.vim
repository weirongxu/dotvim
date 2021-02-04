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
      \ 'coc-ultisnips',
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
nmap <silent> <Leader>: <Plug>(coc-floatinput-command)
nmap <silent> <Leader>c: <Plug>(coc-floatinput-coc-command)
nmap <Leader>rf <Plug>(coc-refactor)
nmap <Leader>aa :CocAction<CR>
vmap <Leader>aa :CocAction<CR>
nmap <Leader>oo <Plug>(coc-openlink)
nmap <Leader>fx <Plug>(coc-fix-current)
nmap <Leader>fi :CocCommand editor.action.organizeImport<CR>
nmap <Leader>ff <Plug>(coc-format)
vmap <Leader>ff <Plug>(coc-format-selected)
nmap <silent> K :call <SID>show_documentation()<CR>
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

nmap <Leader>lr :CocListResume<CR>
nmap <Leader>ll :CocList<CR>
nmap <Leader>lb :CocList --normal buffers<CR>
nmap <Leader>fg :CocList -I grep<CR>
nmap <Leader>fG :CocList -I grep -regex <CR>
nmap <Leader>fcg :exe 'CocList --normal -I --input='.expand('<cword>').' grep'<CR>
nmap <Leader>lc :CocList commands<CR>
nmap <Leader>lC :CocList vimcommands<CR>
nmap <Leader>lCh :CocList cmdhistory<CR>
nmap <Leader>l/ :CocList searchhistory<CR>
nmap <Leader>lo :CocList outline<CR>
nmap <Leader>le :CocList extensions<CR>
nmap <Leader>lmp :CocList marketplace<CR>
nmap <Leader>ld :CocList diagnostics<CR>
nmap <Leader>ls :CocList services<CR>

nmap <Leader>[[ :CocPrev<CR>
nmap <Leader>]] :CocNext<CR>

" ctrl-p
nmap <C-p> :CocList files<CR>

" actions
nmap <Leader>ccp :call CocAction("pickColor")<CR>
nmap <Leader>ccP :call CocAction("colorPresentation")<CR>

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
nmap <Leader>g< :CocCommand git.chunkStage<CR>
nmap <Leader>g= :CocCommand git.chunkUndo<CR>
nmap <Leader>lg :CocList gstatus<CR>
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
nmap <Leader>ee :CocCommand explorer<CR>
nmap <Leader>ef :CocCommand explorer --preset floating<CR>
nmap <Leader>et :CocCommand explorer --preset tab<CR>
nmap <Leader>eh :CocCommand explorer --preset floatingLeftside<CR>
nmap <Leader>el :CocCommand explorer --preset floatingRightside<CR>
nmap <Leader>ev :CocCommand explorer --preset .vim<CR>
nmap <Leader>ec :CocCommand explorer --preset cocConfig<CR>
nmap <Leader>eb :CocCommand explorer --preset buffer<CR>
nmap <Leader>eg :CocCommand explorer --preset git<CR>
nmap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

autocmd ColorScheme *
      \ hi CocHelperNormalFloatBorder guifg=#dddddd guibg=#575B54
      \ | hi CocHelperNormalFloat guibg=#575B54

function! s:explorer_cur_dir()
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  return fnamemodify(node_info['fullpath'], ':h')
endfunction

function! s:exec_cur_dir(cmd)
  let dir = s:explorer_cur_dir()
  execute 'cd ' . dir
  execute a:cmd
endfunction

function! s:init_explorer()
  set winblend=10

  " Integration with other plugins

  " CocList
  nmap <buffer> <Leader>fg :call <SID>exec_cur_dir('CocList -I grep')<CR>
  nmap <buffer> <Leader>fG :call <SID>exec_cur_dir('CocList -I grep -regex')<CR>
  nmap <buffer> <C-p> :call <SID>exec_cur_dir('CocList files')<CR>

  " vim-floaterm
  nmap <buffer> <Leader>ft :call <SID>exec_cur_dir('FloatermNew --wintype=floating')<CR>
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
  function! s:is_float(winnr) abort
    let winid = win_getid(a:winnr)
    return !empty(nvim_win_get_config(winid)['relative'])
  endfunction

  function s:quit()
    let nr = winnr('$')
    while nr > 0
      if !s:is_float(nr)
        if nr == 1
          call coc#float#close_all()
          break
        endif
      endif
      let nr -= 1
    endwhile
    :quit
  endfunction

  nmap <silent> <c-w>q :call <SID>quit()<CR>
  nmap <silent> ZZ :call <SID>quit()<CR>
endif
