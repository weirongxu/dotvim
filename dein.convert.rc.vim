let s:source = $MYVIMFILES.'/dein.rc.yml'
let s:target = $MYVIMFILES.'/dein.rc.vim'

function! DeinParse() "{{{
  let ret = system($MYVIMFILES.'/dein.convert.py ' . s:source . ' ' . s:target, '2>&1')
  if !empty(ret)
    echo ret
  endif
endfunction "}}}

if getftime(s:source) > getftime(s:target)
  call DeinParse()
endif

Inc dein
