let s:filetypes = {}
let s:need_install_exts = []
let s:package_json = coc#util#extension_root() . '/package.json'
if filereadable(s:package_json)
  let s:ext_package_json = join(readfile(s:package_json), "\n")
else
  let s:ext_package_json = ''
endif

function! s:exist_ext(ext)
  return s:ext_package_json =~ '"' . a:ext . '"'
endfunction

function! s:try_install_ext(ext)
  if !s:exist_ext(a:ext)
    let s:need_install_exts = extend(s:need_install_exts, [a:ext])
  endif
endfunction

function! s:add_types(types)
  if !empty(a:types)
    for type in a:types
      let s:filetypes[type] = v:true
    endfor
  endif
endfunction

function! s:add_ext(ext, ...)
  call s:try_install_ext(a:ext)
  call s:add_types(get(a:000, 0, []))
endfunction

function! s:add_cmd(ext, ...)
  call s:add_types(get(a:000, 0, []))
endfunction

call s:add_ext('coc-tsserver', ['javascript', 'javascript.jsx'])
call s:add_cmd('ccls', ['c', 'cpp'])
call s:add_ext('coc-rls', ['rust'])
call s:add_ext('coc-vetur', ['vue'])
call s:add_ext('coc-json', ['json'])
call s:add_ext('coc-css', ['css', 'sass', 'scss', 'less'])
call s:add_ext('coc-html', ['html'])
call s:add_ext('coc-yaml', ['yaml'])
call s:add_ext('coc-gocode', ['golang'])
call s:add_ext('coc-prettier')
call s:add_ext('coc-tag')
call s:add_ext('coc-dictionary')
call s:add_ext('coc-word')
call s:add_ext('coc-jest')
call s:add_ext('coc-emoji')
call s:add_ext('coc-emmet')
call s:add_ext('coc-highlight')
call s:add_ext('coc-neosnippet')
Pkg gem install solargraph
call s:add_ext('coc-solargraph', ['ruby'])

inoremap <silent><expr> <C-l> coc#refresh()
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <Leader><Leader>d  <Plug>(coc-diagnostic-info)
nmap <Leader><Leader>rn <Plug>(coc-rename)
vmap <Leader><Leader>f  <Plug>(coc-format-selected)
nmap <Leader><Leader>ac <Plug>(coc-codeaction)
nmap <Leader><Leader>cl <Plug>(coc-codelens-action)
nmap <Leader><Leader>o  <Plug>(coc-openlink)
nmap <Leader><Leader>f  <Plug>(coc-fix-current)
nmap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if index(['vim', 'help'], &filetype) >= 0
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" autocmd CursorHold * silent call CocActionAsync('highlight')

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)

if !empty(s:need_install_exts)
  execute "CocInstall " . join(s:need_install_exts, " ")
endif

nmap <Leader>lcc :CocList commands<cr>
nmap <Leader>lco :CocList outline<cr>
nmap <Leader>lcw :CocList workspace<cr>
nmap <Leader>lcd :CocList diagnostics<cr>
nmap <Leader>lcs :CocList services<cr>
nmap <Leader>lcl :CocList<cr>
call MenuGroupAdd('coc-actions', 'Coc actions', [
      \ ['pick color', 'call CocAction("pickColor")'],
      \ ['color presentation', 'call CocAction("colorPresentation")'],
      \])
nmap <Leader>lca :Denite menu:coc-actions<cr>
