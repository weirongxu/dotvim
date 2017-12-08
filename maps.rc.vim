" <leader>
let mapleader = ","
let maplocalleader = ","
noremap ,; ,

" fast save
" nmap <silent> <CR> :up<CR>
" some plugins not support update
nmap <silent> <CR> :w<CR>

" fold
noremap <RightMouse> <LeftMouse>za
noremap <2-LeftMouse> <LeftMouse>zA

" key Q open Ex mode very haite
map Q gq
noremap gQ Q

" OS Clipboard
" cat
vnoremap <S-Del> "+x
vnoremap <leader>x "+x
" copy
vnoremap <C-Insert> "+y
vnoremap <leader>y "+y
" put
map <S-Insert> "+p
map <leader>p "+p
map <leader>P "+P

" record
map <F4> @q

" align code
map <leader>c :set cuc!<CR>

" control cursour by alt
imap <silent> <M-h> <ESC>i
imap <silent> <M-j> <ESC>ja
imap <silent> <M-k> <ESC>ka
imap <silent> <M-l> <ESC>la

" control buffer
nmap <silent> <leader>o :only<CR>
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

" path
" command! EchoPath echo expand("%:p")
command! CdHere exec 'cd ' expand("%:p:h")
