let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
nmap gb :bnext<CR>
nmap gB :bprev<CR>

" let g:airline#extensions#branch#custom_head = 'gina#component#repo#branch'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline#extensions#branch#custom_head = 'AirlineGitBranch'

function! AirlineGitBranch()
  return get(g:, 'coc_git_status', '') . get(b:, 'coc_git_status', '')
endfunction

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

function! AirlinePosition()
  if winwidth(0) > 70
    return noscrollbar#statusline()
  else
    return line('.') * 100 / line('$') . '%'
  endif
endfunction

function! AirlineInit()
  if exists('*noscrollbar#statusline')
    call airline#parts#define_function('my-position', 'AirlinePosition')
    let g:airline_section_z = airline#section#create([substitute(g:airline_section_z, '%3p%%', airline#section#create(['my-position']), '')])
  end
endfunction

au User AirlineAfterInit call AirlineInit()

let g:airline_exclude_filetypes = ["list"]
