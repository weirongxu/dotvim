if ! exists('*Include')
  function! Include(path, current, error) "{{{
    try
      if a:path[0] == '/'
        let path = $MY_VIMFILES . a:path
      else
        let path = a:current . '/' . a:path
      endif
      execute 'source ' . path
    catch /^Vim\%((\a\+)\)\=:E484/
      if a:error
        echoerr 'Cant Include ' . a:path . ': ' . v:exception
      endif
    endtry
  endfunction "}}}
endif

command! -nargs=1 Include call Include("<args>", expand('<sfile>:p:h'), 1)
command! -nargs=1 TryInclude call Include("<args>", expand('<sfile>:p:h'), 0)

Include env.vim
Include command.vim
Include package-installer.vim
Include plugin-manager.vim

Pkg npm install neovim
