let s:source = $MY_VIMFILES.'/dein.rc.yml'
let s:target = $MY_VIMFILES.'/dein.rc.vim'

function! DeinParse() "{{{
  let ret = system($MY_VIMFILES.'/dein.convert.py ' . s:source . ' ' . s:target, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

function! s:checkUpdate() "{{{
  if getftime(s:source) > getftime(s:target)
    call DeinParse()
  else
    for name in split(glob($MY_VIMFILES.'/dein-repos-yml/*.yml'), '\n')
      if getftime(name) > getftime(s:target)
        call DeinParse()
        break
      endif
    endfor
  endif
endfunction "}}}

call s:checkUpdate()

Inc dein
