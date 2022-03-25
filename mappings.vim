" <Leader>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" save
map <silent> <C-s> <Cmd>w<CR>
imap <silent> <C-s> <Cmd>w<CR>
map <silent> <D-s> <Cmd>w<CR>
nmap <silent> <Leader>s <Cmd>w<CR>

" fold
noremap <RightMouse> <LeftMouse>za
noremap <2-LeftMouse> <LeftMouse>zA

" remap Q
map Q gq
noremap gQ Q

imap <C-b>q `
cmap <C-b>q `

" Clipboard
vmap <S-Del> "+x
vmap <Leader>x "+x
map <Leader>x "+x

vmap <C-Insert> "+y
vmap <Leader>y "+y
map <Leader>y "+y
map <Leader>Y "+Y

map <S-Insert> "+p
map <Leader>p "+p
map <Leader>P "+P

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

" align code
map <Leader><Leader>cl <Cmd>set cuc!<CR>

" control cursour by alt
inoremap <silent> <M-h> <C-o>h
inoremap <silent> <M-j> <C-o>j
inoremap <silent> <M-k> <C-o>k
inoremap <silent> <M-l> <C-o>l

" control buffer
noremap <silent> <C-W><Up> 5<C-w>+
noremap <silent> <C-W><Down> 5<C-w>-
noremap <silent> <C-W><Right> 5<C-w>>
noremap <silent> <C-W><Left> 5<C-w><
map <silent> <C-h> <Cmd>wincmd h<CR>
map <silent> <C-j> <Cmd>wincmd j<CR>
map <silent> <C-k> <Cmd>wincmd k<CR>
map <silent> <C-l> <Cmd>wincmd l<CR>

" tab control
map <silent> gn <Cmd>tab split<CR>
map <silent> gN <Cmd>tab new<CR>
map <silent> <C-tab> <Cmd>tabnext<CR>
map <silent> <S-l> <Cmd>tabnext<CR>
map <silent> <C-S-tab> <Cmd>tabprevious<CR>
map <silent> <S-h> <Cmd>tabprevious<CR>
map <silent> <S-Left> <Cmd>tabmove -1<CR>
map <silent> <S-Right> <Cmd>tabmove +1<CR>

" jump to end of line while in Insert Mode
inoremap <expr> <C-e> pumvisible() ? "\<C-e>" : "\<C-o>$"
inoremap <C-a> <C-o>^
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

let s:gmove_mode = v:false
function! s:gmove_toggle() abort
  if !s:gmove_mode
    nnoremap j gj
    nnoremap k gk
    let s:gmove_mode = v:true
    echom 'gj/gk mode'
  else
    nunmap j
    nunmap k
    let s:gmove_mode = v:false
    echom 'normal mode'
  endif
endfunction
nmap <Leader><Leader>g <Cmd>call <SID>gmove_toggle()<CR>

" add semicolon
nmap <silent> <M-;> <Cmd>call <SID>append_mark(';')<CR>
fun! s:append_mark(mark)
  let lines = getline('.')
  if match(lines, '[' . a:mark . '{]\s*$') == -1
    call setline(line('.'), lines . a:mark)
  endif
endf

" terminal
" tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <C-o> <C-\><C-n>
function! s:split_terminal()
  let l:cwd = &buftype == 'terminal' ? getcwd() : expand("%:p:h")
  let l:sh = $SHELL
  if g:env#nvim
    split
    let l:cmd = 'cd ' . l:cwd . ' && ' . l:sh
    exec 'terminal ' . l:cmd
  else
    split
    exec 'lcd ' . l:cwd
    exec 'terminal ++curwin ++close ' . l:sh
  endif
endfunction
command! Terminal call <SID>split_terminal()

function! s:syn_stack()
  for id in synstack(line('.'), col('.'))
    execute('hi ' . synIDattr(id, "name"))
  endfor
endfunc
command! SynStack call s:syn_stack()

" path
" command! EchoPath echo expand("%:p")
command! CdHere exec 'cd ' expand("%:p:h")

" edit
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
