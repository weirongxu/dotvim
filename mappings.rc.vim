" <Leader>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" save
noremap <silent> <C-s> :w<CR>
inoremap <silent> <C-s> <C-o>:w<CR>
noremap <silent> <D-s> :w<CR>
nnoremap <silent> <Leader>s :w<CR>

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

function TogglePaste()
  if &paste
    set nopaste
    echo 'nopaste'
  else
    set paste
    echo 'paste'
  endif
endfunction
map <silent> <Leader><Leader>p :call TogglePaste()<CR>
function OffPaste(...)
  if &paste
    set nopaste
    echo 'nopaste'
  endif
endfunction
function TmpEnterPaste()
  if !&paste
    set paste
    echo 'paste'
  endif
  call timer_start(5000, 'OffPaste')
endfunction
imap <silent> <C-V> <C-o>:call TmpEnterPaste()<CR>

" align code
noremap <Leader><Leader>cl :set cuc!<CR>

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
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-l> :wincmd l<CR>

" tab control
noremap <silent> gn :tab split<CR>
noremap <silent> gN :tab new<CR>
noremap <silent> <C-tab> :tabnext<CR>
noremap <silent> <S-l> :tabnext<CR>
noremap <silent> <C-S-tab> :tabprevious<CR>
noremap <silent> <S-h> :tabprevious<CR>
noremap <silent> <S-Left> :tabmove -1<CR>
noremap <silent> <S-Right> :tabmove +1<CR>

" jump to end of line while in Insert Mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^
cnoremap <C-a> <Home>
cnoremap <C-e> <End>

" add semicolon
nmap <silent> <M-;> :call <SID>AppendMark(';')<CR>
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
