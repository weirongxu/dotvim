function! NpmInstall(package, ...) "{{{
  if executable('npm')
    if a:0 > 0
      let cmd = a:1
    else
      let cmd = a:package
    endif
    if ! executable(cmd)
      echo 'install ' . a:package
      call system('npm install -g ' . a:package)
    endif
  endif
endfunction "}}}

command! -nargs=* NpmInstall call NpmInstall(<f-args>)
