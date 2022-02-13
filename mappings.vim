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

function! TogglePaste()
  if &paste
    set nopaste
    echo 'nopaste'
  else
    set paste
    echo 'paste'
  endif
endfunction
map <silent> <Leader><Leader>p <Cmd>call TogglePaste()<CR>
function! OffPaste(...)
  if &paste
    set nopaste
    echo 'nopaste'
  endif
endfunction
function! TmpEnterPaste()
  if !&paste
    set paste
    echo 'paste'
  endif
  call timer_start(5000, 'OffPaste')
endfunction
imap <silent> <C-V> <C-o>:call TmpEnterPaste()<CR>

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
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" add semicolon
nmap <silent> <M-;> <Cmd>call <SID>AppendMark(';')<CR>
fun! s:AppendMark(mark)
  let lines = getline('.')
  if match(lines, '[' . a:mark . '{]\s*$') == -1
    call setline(line('.'), lines . a:mark)
  endif
endf

" terminal
" tnoremap <ESC><ESC> <C-\><C-n>
tnoremap <C-o> <C-\><C-n>
function! SplitTerminal()
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
command! Terminal call SplitTerminal()

function! SynStack()
  for id in synstack(line('.'), col('.'))
    execute('hi ' . synIDattr(id, "name"))
  endfor
endfunc
command! SynStack call SynStack()

" path
" command! EchoPath echo expand("%:p")
command! CdHere exec 'cd ' expand("%:p:h")

" edit
command! -bar -range=% Reverse <line1>,<line2>g/^/m<line1>-1|nohl
