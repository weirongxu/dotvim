let s:target = $MY_VIMFILES.'/plugins-compiled.rc.vim'
let s:plugins_dir = $MY_VIMFILES.'/plugins'
let s:source = s:plugins_dir.'/index.rc.yml'
let s:target_type = 'dein.vim'
let s:script = $MY_VIMFILES . '/plugins-convert.py'

function! s:system_command(py_command) "{{{
  let ret = system(a:py_command . ' '.s:script.' ' . s:source . ' ' . s:target . ' ' . s:target_type, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

function! PluginsParse() "{{{
  if g:env#python3
    execute 'py3file ' . fnameescape(s:script)
py3 << endpy
import vim
run(vim.eval('s:source'), vim.eval('s:target'), vim.eval('s:target_type'))
endpy
    return
  endif
  if g:env#python2
    execute 'pyfile ' . fnameescape(s:script)
py << endpy
import vim
run(vim.eval('s:source'), vim.eval('s:target'), vim.eval('s:target_type'))
endpy
    return
  endif
  if executable('python3')
    return s:system_command('python3')
  endif
  if executable('python2')
    return s:system_command('python2')
  endif
endfunction "}}}

function! s:check_update() "{{{
  for name in split(glob(s:plugins_dir . '/**/*.yml'), '\n')
    if getftime(name) > getftime(s:target)
      call PluginsParse()
      break
    endif
  endfor
endfunction "}}}

call s:check_update()

Inc plugins-compiled
