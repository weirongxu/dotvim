" <Leader>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" save
map <silent> <C-s> <Cmd>w<CR>
imap <silent> <C-s> <Cmd>w<CR>
map <silent> <D-s> <Cmd>w<CR>
nmap <silent> <Leader>s <Cmd>w<CR>

" remap Q
map Q gq
noremap gQ Q

imap <C-b>q `
cmap <C-b>q `

" align code
map <Leader><Leader>cc <Cmd>set cursorcolumn!<CR>
map <Leader><Leader>cl <Cmd>set cursorline!<CR>

function! s:sync_view()
  let view = winsaveview()
  normal gg
  " set scrollbind
  setl cursorbind
  setl cursorline
  setl cursorlineopt=screenline
  call winrestview(view)
endfunction

map <Leader><Leader>sv <Cmd>call <SID>sync_view()<CR>

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
