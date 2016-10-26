let s:source = $MY_VIMFILES.'/plugins.rc.yml'
let s:target = $MY_VIMFILES.'/plugins-compiled.rc.vim'
let s:include_dir = $MY_VIMFILES.'/plugins-repos'
let s:target_type = 'dein.vim'

function! PluginsParse() "{{{
  let ret = system($MY_VIMFILES.'/plugins-convert.py ' . s:source . ' ' . s:target . ' ' . s:target_type . ' ' . s:include_dir, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

function! s:checkUpdate() "{{{
  if getftime(s:source) > getftime(s:target)
    call PluginsParse()
  else
    for name in split(glob(s:include_dir . '/*.yml'), '\n')
      if getftime(name) > getftime(s:target)
        call PluginsParse()
        break
      endif
    endfor
  endif
endfunction "}}}

call s:checkUpdate()

Inc plugins-compiled
