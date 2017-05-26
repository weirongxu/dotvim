let s:target = $MY_VIMFILES.'/plugins-compiled.rc.vim'
let s:plugins_dir = $MY_VIMFILES.'/plugins'
let s:source = s:plugins_dir.'/index.rc.yml'
let s:target_type = 'dein.vim'

function! PluginsParse() "{{{
  let ret = system($MY_VIMFILES.'/plugins-convert.py ' . s:source . ' ' . s:target . ' ' . s:target_type, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

function! s:checkUpdate() "{{{
  for name in split(glob(s:plugins_dir . '/**/*.yml'), '\n')
    if getftime(name) > getftime(s:target)
      call PluginsParse()
      break
    endif
  endfor
endfunction "}}}

call s:checkUpdate()

Inc plugins-compiled
