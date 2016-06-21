let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1

call dein#begin($DEIN_DIR)
call dein#local($DEIN_DIR.'-local')

Inc plugins/unite-menu
Inc dein.convert

call dein#end()

map <leader>z :call zeal#execute(context_filetype#get_filetype(), expand("<cword>"))<CR>

command! DeinInstall
      \ if dein#check_install() |
      \   call dein#install() |
      \ endif
command! -nargs=* DeinUpdate call dein#update(<f-args>)
