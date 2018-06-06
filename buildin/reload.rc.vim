if ! exists('*ReloadVimrc')
  function! ReloadVimrc() "{{{
    Include /vimrc
  endfunction "}}}

  autocmd FileWritePost *.rc.vim, *.rc.yml call ReloadVimrc()
endif
