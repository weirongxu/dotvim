" vimwiki
" au BufRead,BufNewFile *.wiki set filetype=vimwiki | setl nowrap
au BufRead,BufNewFile *.wiki set filetype=vimwiki
au FileType vimwiki if !exists('b:vimwiki_list') | let b:vimwiki_list = {} | endif |
      \ let b:vimwiki_list['template_path'] = g:vimwiki_dir.'/' |
      \ let b:vimwiki_list['template_default'] = 'default' |
      \ let b:vimwiki_list['template_ext'] = '.html'
let g:vimwiki_dir = $MYVIMFILES.'/vimwiki'
let g:vimwiki_list = [{ 
      \ 'path': g:vimwiki_dir.'/docs/',
      \ 'path_html': g:vimwiki_dir.'/html/',
      \ 'template_path': g:vimwiki_dir.'/',
      \ 'template_default': 'default',
      \ 'template_ext': '.html'
      \ }]
let g:vimwiki_html_header_numbering = 2
let g:vimwiki_hl_headers = 1
let g:vimwiki_CJK_length = 1
let g:vimwiki_list_ignore_newline = 0
let g:vimwiki_use_mouse = 1
let g:vimwiki_valid_html_tags='b,i,s,u,sub,sup,kbd,del,br,hr,div,code,h1'
" if has('win32')
  " let g:vimwiki_w32_dir_enc = 'gb18030'
" endif

autocmd FileType vimwiki call <SID>Vimwiki_my_key()
function! s:Vimwiki_my_key()
  if !exists('b:vimwiki_my_key')
    imap <buffer> <C-S-CR> <br/><CR>
    imap <buffer> <S-CR> <br/>
    nmap <buffer> <C-S-CR> i<br/><CR><Esc>

    nmap <buffer> _ :call <SID>Vimwiki_wrap('_')<CR>
    nmap <buffer> <LocalLeader>8 :call <SID>Vimwiki_wrap('*')<CR>
    nmap <buffer> <LocalLeader>6 :call <SID>Vimwiki_wrap('^')<CR>
    nmap <buffer> <LocalLeader>~ :call <SID>Vimwiki_wrap('~~')<CR>
    nmap <buffer> <LocalLeader>` :call <SID>Vimwiki_wrap('`')<CR>
    nmap <buffer> [ :call <SID>Vimwiki_newLineEcho('{{{')<CR>
    nmap <buffer> ] :call <SID>Vimwiki_newLineEcho('}}}')<CR>

    nmap <buffer> <LocalLeader>x <Plug>VimwikiToggleListItem
    " 针对dev版，但dev有todo列表没有样式
    " nmap <buffer> <LocalLeader>x <Plug>VimwikiToggleCheckbox

    map <buffer> <F5> :call <SID>Vimwiki_check()<CR>:Vimwiki2HTML<CR>
    map <buffer> <C-F5> :call <SID>Vimwiki_check()<CR>
          \:call<SID>Vimwiki_compile_all()<CR>
    map <buffer> <F6> :setl wrap!<CR>
    map <buffer> <F8> :call <SID>Vimwiki_check()<CR>:Vimwiki2HTMLBrowse<CR>

    imap <expr><C-TAB> neosnippet#expandable_or_jumpable() ?
          \ "\<Plug>(neosnippet_expand_or_jump)"
          \: "\<C-TAB>"
    let b:vimwiki_my_key = 1
  endif
endfunction

function! s:Vimwiki_newLineEcho(sign)
  if getline('.') == ''
    call feedkeys('i'.a:sign."\<Esc>")
  else
    call feedkeys('o'.a:sign."\<Esc>")
  endif
endfunction

function! s:Vimwiki_wrap(wrap)
  let cont = substitute(getline('.'), '^\s\+\|\s\+$', '', 'g')
  if cont =~ '\V'.a:wrap.'\.\{1,}'.a:wrap
    call setline('.', cont[len(a:wrap):-1-len(a:wrap)])
  else
    call setline('.', a:wrap.cont.a:wrap)
  endif
endfunction

function! s:Vimwiki_check()
    let idx = g:vimwiki_current_idx
    if has_key(g:vimwiki_list[idx], 'temp') && g:vimwiki_list[idx]['temp'] == 1
      let g:vimwiki_list[idx]['template_path'] = g:vimwiki_dir.'/'
      let g:vimwiki_list[idx]['template_default'] = 'default'
      let g:vimwiki_list[idx]['template_ext'] = '.html'
    endif
endfunction

function! s:Vimwiki_compile_all()
  let compile_css_path = expand(VimwikiGet('path_html'))
  let compile_css_full_path = compile_css_path.'/style.css'
  if glob(compile_css_full_path) == ""
    call vimwiki#base#mkdir(fnamemodify(compile_css_full_path, ':p:h'))
    let my_style_css = glob(g:vimwiki_dir.'/style.css')
    if my_style_css != ''
      let lines = readfile(my_style_css)
      call writefile(lines, compile_css_full_path)
      echomsg "My style.css has been created."
    endif
  endif
  VimwikiAll2HTML
endfunction

