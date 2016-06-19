function! ReloadVimrc() "{{{
  Inc /vimrc
endfunction "}}}

autocmd FileWritePost *.rc.vim, *.rc.yml call ReloadVimrc()
