let s:source = $MY_VIMFILES.'/dein.rc.yml'
let s:target = $MY_VIMFILES.'/dein.rc.vim'

function! DeinParse() "{{{
  let ret = system($MY_VIMFILES.'/dein.convert.py ' . s:source . ' ' . s:target, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

if getftime(s:source) > getftime(s:target)
  call DeinParse()
endif

Inc dein
