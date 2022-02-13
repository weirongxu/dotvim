function! s:get_root_path()
  if !exists('s:root_path')
    let lines = systemlist('npm root -g')
    let lines = filter(lines, {idx, val -> val !~? 'Now using node v\d+\.\d+\.\d+'})
    let s:root_path = trim(join(lines, ''))
  endif
  return s:root_path
endfunction

function! package_installer#npm#exists(package_name)
  return isdirectory(s:get_root_path() . '/' . a:package_name)
endfunction

function! package_installer#npm#install(package_name)
  call system('npm install -g ' . a:package_name)
  return !v:shell_error
endfunction

function! package_installer#npm#uninstall(package_name)
  call system('npm uninstall -g ' . a:package_name)
  return !v:shell_error
endfunction
