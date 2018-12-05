" <leader>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" save
" nmap <silent> <CR> :up<CR>
" some plugins not support update
nmap <silent> <CR> :w<CR>
map <silent> <C-s> :w<CR>
nmap <silent> <Leader>s :w<CR>

" fold
map <RightMouse> <LeftMouse>za
map <2-LeftMouse> <LeftMouse>zA

" remap Q
map Q gq
noremap gQ Q

" Clipboard
vmap <S-Del> "+x
vmap <leader>x "+x
map <leader>x "+x

vmap <C-Insert> "+y
vmap <leader>y "+y
map <leader>y "+y
map <leader>Y "+Y

map <S-Insert> "+p
map <leader>p "+p
map <leader>P "+P

" record
map <F4> @q

" align code
map <leader><leader>cl :set cuc!<CR>

" control cursour by alt
imap <silent> <M-h> <ESC>i
imap <silent> <M-j> <ESC>ja
imap <silent> <M-k> <ESC>ka
imap <silent> <M-l> <ESC>la

" control buffer
map <silent> <C-W><Up> 5<c-w>+
map <silent> <C-W><Down> 5<c-w>-
map <silent> <C-W><Right> 5<c-w>>
map <silent> <C-W><Left> 5<c-w><
map <silent> <C-h> :wincmd h<cr>
map <silent> <C-j> :wincmd j<cr>
map <silent> <C-k> :wincmd k<cr>
map <silent> <C-l> :wincmd l<cr>

" tab control
map <silent> gn :tab split<cr>
map <silent> gN :tab new<cr>
map <silent> <C-tab> :tabnext<cr>
map <silent> <S-l> :tabnext<cr>
map <silent> <C-S-tab> :tabprevious<cr>
map <silent> <S-h> :tabprevious<cr>
map <silent> <S-Left> :tabmove -1<cr>
map <silent> <S-Right> :tabmove +1<cr>

" jump to end of line while in Insert Mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>I

" add semicolon
nmap <silent> <M-;> :call <SID>AppendMark(';')<CR>
fun! s:AppendMark(mark)
  let lines = getline('.')
  if match(lines, '[' . a:mark . '{]\s*$') == -1
    call setline(line('.'), lines . a:mark)
  endif
endf

" terminal
tnoremap <ESC> <C-\><C-n>

" path
" command! EchoPath echo expand("%:p")
command! CdHere exec 'cd ' expand("%:p:h")
