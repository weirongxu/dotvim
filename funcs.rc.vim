function! NpmInstall(package, ...) "{{{
  if a:0 > 0
    let cmd = a:1
  else
    let cmd = a:package
  endif
  if ! executable(cmd)
    call system('npm install -g ' . a:package)
  endif
endfunction "}}}

command! -nargs=* NpmInstall call NpmInstall(<f-args>)
