let s:pkg_installer_dir = $MY_BUILDIN . '/package-installer'
let s:V = vital#vimrc#new()
let s:Process = s:V.import('System.Process')
let s:Job = s:V.import('System.Job')

let s:pkgs = ['npm', 'pip3', 'gem']
let s:actions = ['install', 'uninstall', 'update']

function! Pkg(name, action, package_name) "{{{
  call timer_start(0, function(
        \ 'package_installer#runner#start',
        \ [a:name, a:action, a:package_name]))
endfunction "}}}

function! s:complete(arglead, cmdline, cursorpos) "{{{
  let cmds = split(a:cmdline, '\V\s\+', 1)
  let candidates = []
  if len(cmds) == 2
    let candidates = extend([], s:pkgs)
  elseif len(cmds) == 3
    let candidates =  extend([], s:actions)
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
