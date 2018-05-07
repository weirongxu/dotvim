let s:pkg_installer_dir = $MY_VIMFILES.'/package-installer'
let s:Process = vital#vimrc#import('System.Process')

function! Pkg(name, action, package_name) "{{{
  let cmds = [
        \ 'python3',
        \ s:pkg_installer_dir . '/' . a:name . '.py',
        \ a:action,
        \ a:package_name,
        \]
  " echo join(cmds)
  call s:Process.execute(cmds, {
        \ 'background': 1,
        \})
endfunction "}}}

function! s:complete(arglead, cmdline, cursorpos) "{{{
  let cmds = split(a:cmdline, '\V\s\+', 1)
  let candidates = []
  if len(cmds) == 2
    let candidates = map(
          \ split(glob(s:pkg_installer_dir . '/*.py'), "\n"),
          \ {idx, path -> fnamemodify(path, ':t:r')}
          \)
  elseif len(cmds) == 3
    let candidates =  ['install', 'update', 'uninstall']
  endif
  if len(candidates) > 0
    let lastcmd = cmds[-1]
    let candidates = filter(
          \ candidates,
          \ {idx, val -> strpart(val, 0, strlen(lastcmd)) == lastcmd}
          \)
  endif
  return candidates
endfunction "}}}

command! -nargs=* -complete=customlist,s:complete Pkg call Pkg(<f-args>)
