if ! exists('*Include')
  function! Include(path, current) "{{{
    try
      if a:path[0] == '/'
        let path = $MY_VIMFILES . a:path
      else
        let path = a:current . '/' . a:path
      endif
      execute 'source ' . path . '.rc.vim'
    catch E484
      echo 'Cant Inc ' . a:path
    endtry
  endfunction "}}}
endif

command! -nargs=1 Inc call Include("<args>", expand('<sfile>:p:h'))

Inc env
Inc reload
