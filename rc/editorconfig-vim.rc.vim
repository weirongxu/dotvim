function! s:vim_charset_hook(config)
  if has_key(a:config, 'vim-charset')
    let charset_match = matchlist(a:config['vim-charset'], '\v(.*)-bom$')
    if empty(charset_match)
      let &l:fileencoding=a:config['vim-charset']
      setl nobomb
    else
      let &l:fileencoding=charset_match[1]
      setl bomb
    endif
  endif
  return 0
endfunction
call editorconfig#AddNewHook(function('s:vim_charset_hook'))
