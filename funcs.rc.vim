function! s:trim(str) "{{{
  return matchstr(a:str, '^\s*\zs.\{-}\ze\s*$')
endfunction "}}}

function! s:trim_multiline(str) abort
  let strs = split(a:str)
  return join(map(strs, 's:trim(v:val)'), '')
endfunction

function! s:remove_node_version_info(str) "{{{
  return substitute(a:str, '^.\{-}\ze[/\\]', '', '')
endfunction "}}}

function! NpmInstall(package) "{{{
  if executable('npm')
    " too slow
    " call system('npm ls -g --depth=0 ' . a:package)
    " if v:shell_error
    let root_dir = s:remove_node_version_info(s:trim_multiline(system('npm root -g')))
    if ! isdirectory(root_dir . '/' . a:package)
      let cmd = 'npm install -g ' . a:package
      echo cmd
      call system(cmd)
    endif
  endif
endfunction "}}}

command! -nargs=* NpmInstall call NpmInstall(<f-args>)

function! Pip3Install(package) "{{{
  if executable('pip3')
    call system('pip3 show ' . a:package)
    if v:shell_error
      let cmd = 'pip3 install --upgrade ' . a:package
      echo cmd
      call system(cmd)
    endif
  endif
endfunction "}}}

command! -nargs=* Pip3Install call Pip3Install(<f-args>)
