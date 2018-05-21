let s:plugins_dir = $MY_VIMFILES.'/plugins'
let s:source = s:plugins_dir.'/index.rc.yml'
let s:target_type = 'dein.vim'
let s:script = $MY_VIMFILES . '/plugins-convert.py'

function! PluginsConvert() "{{{
  if g:env#python3
    execute 'py3file ' . fnameescape(s:script)
py3 << endpy
import vim
run(vim.eval('s:source'), vim.eval('$PLUGINS_COMPILED'), vim.eval('s:target_type'))
endpy
    return
  elseif g:env#python2
    execute 'pyfile ' . fnameescape(s:script)
py << endpy
import vim
run(vim.eval('s:source'), vim.eval('$PLUGINS_COMPILED'), vim.eval('s:target_type'))
endpy
    return
  elseif ! empty(g:env#python_cmd)
    let ret = system(g:env#python_cmd . ' '.s:script.' ' . s:source . ' ' . $PLUGINS_COMPILED . ' ' . s:target_type, '2>&1')
    if !empty(ret)
      echo ret
    endif
  endif
endfunction "}}}

function! s:check_update() "{{{
  for name in split(glob(s:plugins_dir . '/**/*.yml'), '\n')
    if getftime(name) > getftime($PLUGINS_COMPILED)
      call PluginsConvert()
      break
    endif
  endfor
endfunction "}}}

call s:check_update()
