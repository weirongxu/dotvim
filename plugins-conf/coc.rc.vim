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
      \ 'coc-python',
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
nmap <Leader>rn <Plug>(coc-rename)
nmap <Leader>rf <Plug>(coc-refactor)
nmap <Leader>ca :CocAction<CR>
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

nmap <Leader>[l :CocPrev<CR>
nmap <Leader>]l :CocNext<CR>

" ctrl-p
nmap <C-p> :CocList files<CR>

" actions
nmap <Leader>ccp :call CocAction("pickColor")<CR>
nmap <Leader>ccP :call CocAction("colorPresentation")<CR>

" coc-git
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap <Leader>gi <Plug>(coc-git-chunkinfo)
nmap <Leader>ggc <Plug>(coc-git-commit)
nmap <Leader>g< :CocCommand git.chunkStage<CR>
nmap <Leader>g= :CocCommand git.chunkUndo<CR>
nmap <Leader>lg :CocList gstatus<CR>
omap ic <Plug>(coc-git-chunk-inner)
xmap ic <Plug>(coc-git-chunk-inner)
omap ac <Plug>(coc-git-chunk-outer)
xmap ac <Plug>(coc-git-chunk-outer)

" coc-calc
nmap <Leader>cc <Plug>(coc-calc-result-append)
nmap <Leader>cC <Plug>(coc-calc-result-replace)

" coc-explorer
nmap <Leader>ee :CocCommand explorer<CR>
nmap <Leader>ef :CocCommand explorer --present floating
nmap <Leader>eh :CocCommand explorer --present floatingLeftside
nmap <Leader>el :CocCommand explorer --present floatingRightside
nmap <Leader>ev :CocCommand explorer --present .vim
nmap <Leader>er :call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

let g:coc_explorer_global_presets = {
\   '.vim': {
\      'root-uri': $MY_VIMFILES,
\      'reveal': $MY_PLUGINS,
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
\   }
\ }

function s:coc_list_current_dir(args)
  let node_info = CocAction('runCommand', 'explorer.getNodeInfo', 0)
  if node_info isnot v:null && node_info['expandable']
    execute 'cd ' . node_info['fullpath']
    execute 'CocList ' . a:args
  endif
endfunction

function s:init_explorer()
  nmap <Leader>fg :call <SID>coc_list_current_dir('-I grep')<CR>
  nmap <Leader>fG :call <SID>coc_list_current_dir('-I grep -regex')<CR>
endfunction

augroup CocExplorer
  autocmd FileType coc-explorer call <SID>init_explorer()
augroup END
