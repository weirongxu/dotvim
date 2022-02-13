function! package_installer#gem#exists(package_name)
  call system('gem list -i ' . a:package_name)
  return !v:shell_error
endfunction

function! package_installer#gem#install(package_name)
  call system('gem install ' . a:package_name)
  return !v:shell_error
endfunction

function! package_installer#gem#uninstall(package_name)
  call system('gem uninstall ' . a:package_name)
  return !v:shell_error
endfunction
