let s:sep = has('win32') ? '\' : '/'
let s:uniques = {}

function! s:any_str(...) abort
  for item in a:000
    if !empty(item)
      return item
    endif
  endfor
  return ''
endfunction

function! s:unique_list(may_duplicates) abort
  let uniques = {}
  let may_duplicates = a:may_duplicates

  while !empty(may_duplicates)
    let handles = may_duplicates
    let may_duplicates = []

    let names = map(copy(handles), { _, val -> val['name'] })
    for item in handles
      if count(names, item['name']) == 1
        let uniques[item['bufnr']] = item['name']
        continue
      endif

      if empty(item['parents'])
        continue
      endif

      let parent = item['parents'][-1]
      if empty(parent)
        let uniques[item['bufnr']] = item['name']
        continue
      endif

      let new_parents = item['parents'][:-2]
      let new_name = parent . s:sep . item['name']
      let item['parents'] = new_parents
      let item['name'] = new_name
      call add(may_duplicates, item)
    endfor
  endwhile
  return uniques
endfunction

function! s:update_uniques() abort
  let uniques = {}
  let may_duplicates = []
  for bufnr in range(1, bufnr('$'))
    if bufloaded(bufnr)
      let modifiable = getbufvar(bufnr, '&modifiable')
      let listed = getbufvar(bufnr, '&buflisted')
      if modifiable && listed
        let fullpath = fnamemodify(bufname(bufnr), ':p')
        let parts = split(fullpath, s:sep)
        call add(may_duplicates, {
              \ 'bufnr': bufnr,
              \ 'parents': parts[:-2],
              \ 'name': parts[-1],
              \ })
      else
        let name = s:any_str(bufname(bufnr), '[No Name]')
        let uniques[bufnr] = name
      end
    endif
  endfor
  let s:uniques = extend(uniques, s:unique_list(may_duplicates))
endfunction

function! AirlineGlobalUnique(bufnr, buffers)
  let current_bufnr = bufnr('%')
  let current_modifiable = getbufvar(current_bufnr, '&modifiable')
  let current_listed = getbufvar(current_bufnr, '&buflisted')
  let nr = current_modifiable && current_listed && index(a:buffers, current_bufnr) >= 0 ? current_bufnr : a:bufnr
  let _ =  get(s:uniques, nr, '')
  if getbufvar(nr, '&modified') == 1
    let _ .= g:airline_symbols.modified
  endif
  return _
endfunction

command! AirlineGlobalUniqueDebug echo s:uniques

augroup airline_global_unique
  autocmd!
  autocmd BufWinEnter,BufDelete * call s:update_uniques()
augroup END

