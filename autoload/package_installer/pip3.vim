function! package_installer#pip3#exists(package_name)
  call system('pip3 show ' . a:package_name)
  return !v:shell_error
endfunction

function! package_installer#pip3#install(package_name)
  call system('pip3 install --user ' . a:package_name)
  return !v:shell_error
endfunction

function! package_installer#pip3#uninstall(package_name)
  call system('pip3 uninstall ' . a:package_name)
  return !v:shell_error
endfunction
