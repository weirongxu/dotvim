let s:script = $MY_BUILDIN . '/plugin-compiler/compiler.py'

function! PluginsConvert(plugins_local_dir, source_index, plugins_compiled, target_type) "{{{
  if g:env#python3
    execute 'py3file ' . fnameescape(s:script)
py3 << endpy
import vim
run(vim.eval('a:plugins_local_dir'), vim.eval('a:source_index'), vim.eval('a:plugins_compiled'), vim.eval('a:target_type'))
endpy
    return
  elseif g:env#python2
    execute 'pyfile ' . fnameescape(s:script)
py << endpy
import vim
run(vim.eval('a:plugins_local_dir'), vim.eval('a:source_index'), vim.eval('a:plugins_compiled'), vim.eval('a:target_type'))
endpy
    return
  elseif ! empty(g:env#python_cmd)
    let ret = system(g:env#python_cmd . ' ' . s:script . ' ' . a:plugins_local_dir . ' ' . a:source_index . ' ' . a:plugins_compiled . ' ' . a:target_type, '2>&1')
    if ! empty(ret)
      echo ret
    endif
  endif
endfunction "}}}

function! CheckPluginsUpdated(plugins_local_dir, plugins_dir, source_index, plugins_compiled, target_type) "{{{
  for name in split(glob(a:plugins_dir . '/**/*.yml'), '\n')
    if getftime(name) > getftime(a:plugins_compiled)
      call PluginsConvert(a:plugins_local_dir, a:source_index, a:plugins_compiled, a:target_type)
      return v:true
      break
    endif
  endfor
  return v:false
endfunction "}}}
