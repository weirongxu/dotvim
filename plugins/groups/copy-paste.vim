PluginAdd 'roxma/vim-tmux-clipboard'

" PluginAdd 'machakann/vim-highlightedyank'

if g:env#x && !has('nvim-0.5.0')
  PluginAdd 'haya14busa/vim-operator-flashy', {
        \ 'on_map': '<Plug>(operator-flashy)'
        \ }
  map y <Plug>(operator-flashy)
  nmap Y <Plug>(operator-flashy)$
else
  autocmd TextYankPost * silent! lua vim.highlight.on_yank({higroup="HighlightText", timeout=400})
endif

PluginAdd 'MaxMEllon/vim-shiny'
" let g:vim_shiny_window_change = 1
nmap p  <Plug>(shiny-p)
nmap P  <Plug>(shiny-P)
nmap gp <Plug>(shiny-gp)
nmap gP <Plug>(shiny-gP)

PluginAdd 'ojroques/vim-oscyank'
let g:oscyank_term = 'default'
autocmd TextYankPost *
     \ if v:event.operator is 'y' && v:event.regname is 'o'
     \| execute 'OSCYankRegister o'
     \| endif

" mapping
vmap <S-Del> "ox
vmap <Leader>x "ox
map <Leader>x "ox

vmap <C-Insert> "oy
vmap <Leader>y "oy
map <Leader>y "oy
map <Leader>Y "oY

map <S-Insert> "op
map <Leader>p "op
map <Leader>P "oP

" paste mode
function! s:toggle_paste()
  if &paste
    set nopaste
    echo 'nopaste'
  else
    set paste
    echo 'paste'
  endif
endfunction
map <silent> <Leader><Leader>p <Cmd>call <SID>toggle_paste()<CR>
function! s:off_paste(...)
  if &paste
    set nopaste
    echo 'nopaste'
  endif
endfunction
function! s:tmp_enter_paste()
  if !&paste
    set paste
    echo 'paste'
  endif
  call timer_start(5000, function('s:off_paste'))
endfunction
imap <silent> <C-V> <C-o>:call <SID>tmp_enter_paste()<CR>
