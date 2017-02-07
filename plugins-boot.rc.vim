let $DEIN_DIR = $MY_VIMFILES . '/dein'

if ! &loadplugins
  finish
end

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1

call dein#begin($DEIN_DIR, [$MY_VIMRC])
call dein#local($MY_VIMFILES . '/plugins-local')

Inc plugins-conf/unite-menu
Inc plugins-convert

call dein#end()
call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')

map <leader>z :call zeal#execute(context_filetype#get_filetype(), expand("<cword>"))<CR>
