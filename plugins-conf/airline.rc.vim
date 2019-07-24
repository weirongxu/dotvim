let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
nmap gb :bnext<CR>
nmap gB :bprev<CR>

" let g:airline#extensions#branch#custom_head = 'gina#component#repo#branch'
let g:airline#extensions#branch#custom_head = 'AirlineGitBranch'

function! AirlineCocStatus()
  return get(g:, 'coc_status', '')
endfunction

function! AirlineGitBranch()
  return get(g:, 'coc_git_status', '')
endfunction

function! AirlineGitGutter()
  return get(b:, 'coc_git_status', '')
endfunction

function! AirlinePosition()
  if winwidth(0) > 120
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
  call airline#parts#define_function('coc-status', 'AirlineCocStatus')
  call airline#parts#define_function('coc-git-gutter', 'AirlineGitGutter')
  let g:airline_section_gutter = airline#section#create(['%=', 'readonly', 'coc-status', 'coc-git-gutter'])
endfunction

au User AirlineAfterInit call AirlineInit()

let g:airline_exclude_filetypes = ["list"]
