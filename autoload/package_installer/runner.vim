function! s:exists() dict
  return package_installer#{self.name}#exists(self.package_name)
endfunction

function! s:install() dict
  call package_installer#{self.name}#install(self.package_name)
  echom 'install ' . self.name . ' ' . self.package_name
endfunction

function! s:update() dict
  if exists('*package_installer#' . self.package_name . '#update')
    call package_installer#{self.name}#update(self.package_name)
    echom 'update ' . self.name . ' ' . self.package_name
  else
    call pkg.uninstall()
    call pkg.install()
  endif
endfunction

function! s:uninstall() dict
  call package_installer#{self.name}#uninstall(self.package_name)
  echom 'uninstall ' . self.name . ' ' . self.package_name
endfunction

function! package_installer#runner#start(name, action, package_name, ...)
  let pkg = {
    \ 'name': a:name,
    \ 'action': a:action,
    \ 'package_name': a:package_name,
    \ 'exists': function('s:exists'),
    \ 'install': function('s:install'),
    \ 'uninstall': function('s:uninstall'),
    \}
  let exists_pkg = pkg.exists()
  if a:action == 'install'
    if !exists_pkg
      call pkg.install()
    endif
  elseif a:action == 'update'
    if !exists_pkg
      call pkg.install()
    else
      call pkg.update()
    endif
  elseif a:action == 'uninstall'
    if exists_pkg
      call pkg.uninstall()
    endif
  else
    return
  endif
endfunction
