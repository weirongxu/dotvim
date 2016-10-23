let $DEIN_DIR = $MY_VIMFILES . '/dein'
let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1

call dein#begin($DEIN_DIR)
call dein#local($MY_VIMFILES . '/plugins-local')

Inc plugins/unite-menu
Inc plugins-convert

call dein#end()

map <leader>z :call zeal#execute(context_filetype#get_filetype(), expand("<cword>"))<CR>
