let s:gmove_mode = v:false
function! s:gmove_toggle() abort
  if !s:gmove_mode
    noremap j gj
    noremap k gk
    noremap 0 g0
    noremap $ g$
    noremap ^ g^

    noremap gj j
    noremap gk k
    noremap g0 0
    noremap g$ $
    noremap g^ ^
    let s:gmove_mode = v:true
    echom 'gj/gk mode'
  else
    unmap j
    unmap k
    unmap 0
    unmap $
    unmap ^

    unmap gj
    unmap gk
    unmap g0
    unmap g$
    unmap g^
    let s:gmove_mode = v:false
    echom 'off gj/gk mode'
  endif
endfunction
nmap <Leader><Leader>g <Cmd>call <SID>gmove_toggle()<CR>

let g:space_as_esc = v:false
function! s:space_as_esc_toggle()
  if g:space_as_esc
    let g:space_as_esc = v:false
    nunmap <C-Space>
    iunmap <C-Space>
    vunmap <C-Space>
    cunmap <C-Space>
    sunmap <C-Space>
    nunmap <M-Space>
    iunmap <M-Space>
    vunmap <M-Space>
    cunmap <M-Space>
    sunmap <M-Space>
    echom 'off <C-Space> mode'
  else
    let g:space_as_esc = v:true
    nmap <silent> <C-Space> <ESC>
    imap <silent> <C-Space> <ESC>
    vmap <silent> <C-Space> <ESC>
    cmap <silent> <C-Space> <ESC>
    smap <silent> <C-Space> <ESC>
    nmap <silent> <M-Space> <ESC>
    imap <silent> <M-Space> <ESC>
    vmap <silent> <M-Space> <ESC>
    cmap <silent> <M-Space> <ESC>
    smap <silent> <M-Space> <ESC>
    echom '<C-Space> mode'
  endif
endfunction
nmap <Leader><Leader>z <Cmd>call <SID>space_as_esc_toggle()<CR>

let g:review_mode = v:false
function! s:review_mode_toggle()
  if g:review_mode
    let g:review_mode = v:false
    nunmap <S-w>
    nunmap w
    nunmap <S-e>
    nunmap e
    nunmap q
    nunmap t
    echom 'off review mode'
  else
    let g:review_mode = v:true
    nmap <S-w> [c
    nmap w ]c
    nmap <S-e> [d
    nmap e ]d
    nmap q <Space>gi
    nmap t <Space>g<
    echom 'review mode'
  endif
endfunction
nmap <Leader><Leader>r <Cmd>call <SID>review_mode_toggle()<CR>
