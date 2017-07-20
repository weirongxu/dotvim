function! NpmInstall(package) "{{{
  if executable('npm')
    call system('npm ls -g ' . a:package)
    if v:shell_error
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
