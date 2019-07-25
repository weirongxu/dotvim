let $VIMCONFIG = $MY_VIMFILES
let g:coc_global_extensions = [
      \ 'coc-rls',
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
      \ 'coc-neosnippet',
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
      \ ]
Pkg gem install solargraph

inoremap <silent><expr> <C-l> coc#refresh()
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <Leader><Leader>d  <Plug>(coc-diagnostic-info)
nmap <Leader><Leader>rn <Plug>(coc-rename)
nmap <Leader><Leader>rf <Plug>(coc-refactor)
nmap <Leader><Leader>ac <Plug>(coc-codeaction)
nmap <Leader><Leader>cl <Plug>(coc-codelens-action)
nmap <Leader><Leader>o  <Plug>(coc-openlink)
nmap <Leader><Leader>F  <Plug>(coc-fix-current)
nmap <Leader><Leader>f  <Plug>(coc-format)
vmap <Leader><Leader>f  <Plug>(coc-format-selected)
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
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <Leader>lcc :CocList commands<CR>
nmap <Leader>lco :CocList outline<CR>
nmap <Leader>lcw :CocList workspace<CR>
nmap <Leader>lcd :CocList diagnostics<CR>
nmap <Leader>lcs :CocList services<CR>
nmap <Leader>lcl :CocList<CR>
nmap <Leader>lcr :CocListResume<CR>
call MenuGroupAdd('coc-actions', 'Coc actions', [
      \ ['pick color', 'call CocAction("pickColor")'],
      \ ['color presentation', 'call CocAction("colorPresentation")'],
      \])
nmap <Leader>lca :Denite menu:coc-actions<CR>

" coc-git
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap <Leader><Leader>gs <Plug>(coc-git-chunkinfo)
nmap <Leader><Leader>gc <Plug>(coc-git-commit)

" coc-calc
nmap <Leader><Leader>cc <Plug>(coc-calc-result-append)
nmap <Leader><Leader>cC <Plug>(coc-calc-result-replace)
