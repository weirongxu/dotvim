let $VIMCONFIG = $MY_VIMFILES
let g:coc_global_extensions = [
      \ 'coc-lists',
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
      \ ]
Pkg gem install solargraph

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
nmap <Leader>ca <Plug>(coc-codeaction)
nmap <Leader>cl <Plug>(coc-codelens-action)
nmap <Leader>oo  <Plug>(coc-openlink)
nmap <Leader>fx  <Plug>(coc-fix-current)
nmap <Leader>ff  <Plug>(coc-format)
vmap <Leader>ff  <Plug>(coc-format-selected)
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
nmap <Leader>fg :CocList --strict grep<CR>
nmap <Leader>fG :CocList words<CR>
nmap <Leader>fcg :exe 'CocList --normal -I --input='.expand('<cword>').' grep'<CR>
nmap <Leader>fcG :exe 'CocList --normal -I --input='.expand('<cword>').' words'<CR>
nmap <Leader>lc :CocList commands<CR>
nmap <Leader>lC :CocList vimcommands<CR>
nmap <Leader>lCh :CocList cmdhistory<CR>
nmap <Leader>l/ :CocList searchhistory<CR>
nmap <Leader>lo :CocList outline<CR>
nmap <Leader>lw :CocList workspace<CR>
nmap <Leader>ld :CocList diagnostics<CR>
nmap <Leader>ls :CocList services<CR>

" ctrl-p
nmap <C-p> :CocList files<CR>

" actions
nmap <Leader>ccp :call CocAction("pickColor")<CR>
nmap <Leader>ccP :call CocAction("colorPresentation")<CR>

" coc-git
nmap [c <Plug>(coc-git-prevchunk)
nmap ]c <Plug>(coc-git-nextchunk)
nmap <Leader>ggs <Plug>(coc-git-chunkinfo)
nmap <Leader>ggc <Plug>(coc-git-commit)

" coc-calc
nmap <Leader>cc <Plug>(coc-calc-result-append)
nmap <Leader>cC <Plug>(coc-calc-result-replace)
