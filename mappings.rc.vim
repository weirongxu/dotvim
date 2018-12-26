" <leader>
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

imap <C-_> `

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

" align code
noremap <leader><leader>cl :set cuc!<CR>

" control cursour by alt
inoremap <silent> <M-h> <C-o>h
inoremap <silent> <M-j> <C-o>j
inoremap <silent> <M-k> <C-o>k
inoremap <silent> <M-l> <C-o>l

" control buffer
noremap <silent> <C-W><Up> 5<c-w>+
noremap <silent> <C-W><Down> 5<c-w>-
noremap <silent> <C-W><Right> 5<c-w>>
noremap <silent> <C-W><Left> 5<c-w><
noremap <silent> <C-h> :wincmd h<cr>
noremap <silent> <C-j> :wincmd j<cr>
noremap <silent> <C-k> :wincmd k<cr>
noremap <silent> <C-l> :wincmd l<cr>

" tab control
noremap <silent> gn :tab split<cr>
noremap <silent> gN :tab new<cr>
noremap <silent> <C-tab> :tabnext<cr>
noremap <silent> <S-l> :tabnext<cr>
noremap <silent> <C-S-tab> :tabprevious<cr>
noremap <silent> <S-h> :tabprevious<cr>
noremap <silent> <S-Left> :tabmove -1<cr>
noremap <silent> <S-Right> :tabmove +1<cr>

" jump to end of line while in Insert Mode
inoremap <C-e> <C-o>$
inoremap <C-a> <C-o>^

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
