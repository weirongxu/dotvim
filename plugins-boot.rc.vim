let $DEIN_DIR = $MY_VIMFILES . '/dein'
let $PLUGINS_COMPILED = $MY_VIMFILES.'/plugins-compiled.rc.vim'

if ! &loadplugins
  finish
end

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1
Inc plugins-convert

call dein#begin($DEIN_DIR, [$PLUGINS_COMPILED])

call dein#local($MY_VIMFILES . '/plugins-local')

Inc plugins-conf/unite-menu
Inc plugins-compiled

call dein#end()
call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')

if dein#check_install()
  echo 'install...'
  call dein#install()
endif

map <leader>z :call zeal#execute(context_filetype#get_filetype(), expand("<cword>"))<CR>
