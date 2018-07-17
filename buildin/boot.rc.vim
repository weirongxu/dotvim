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
      echo 'Cant Include ' . a:path
    endtry
  endfunction "}}}
endif

command! -nargs=1 Include call Include("<args>", expand('<sfile>:p:h'))

Include env

" https://github.com/vim/vim/issues/3117
if ! g:env#nvim && g:env#python3
  silent! python3 1
endif

" Include reload
Include package-installer
Include lsp
Include convert-plugin
