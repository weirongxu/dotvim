let s:script = $MY_BUILDIN . '/convert-plugin/convert.py'

function! PluginsConvert(source, target_type, plugins_compiled) "{{{
  if g:env#python3
    execute 'py3file ' . fnameescape(s:script)
py3 << endpy
import vim
run(vim.eval('a:source'), vim.eval('a:plugins_compiled'), vim.eval('a:target_type'))
endpy
    return
  elseif g:env#python2
    execute 'pyfile ' . fnameescape(s:script)
py << endpy
import vim
run(vim.eval('a:source'), vim.eval('a:plugins_compiled'), vim.eval('a:target_type'))
endpy
    return
  elseif ! empty(g:env#python_cmd)
    let ret = system(g:env#python_cmd . ' '.s:script.' ' . a:source . ' ' . a:plugins_compiled . ' ' . a:target_type, '2>&1')
    if ! empty(ret)
      echo ret
    endif
  endif
endfunction "}}}

function! CheckPluginsUpdated(plugins_dir, source, target_type, plugins_compiled) "{{{
  for name in split(glob(a:plugins_dir . '/**/*.yml'), '\n')
    if getftime(name) > getftime(a:plugins_compiled)
      call PluginsConvert(a:source, a:target_type, a:plugins_compiled)
      break
    endif
  endfor
endfunction "}}}
