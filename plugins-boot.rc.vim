let $DEIN_DIR = $MY_VIMFILES . '/dein'
let $PLUGINS_COMPILED = $MY_VIMFILES.'/plugins-compiled.rc.vim'

if ! &loadplugins
  finish
end

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1
Include plugins-convert

if dein#load_state($DEIN_DIR)
  call dein#begin($DEIN_DIR, [$PLUGINS_COMPILED])

  Include plugins-conf/unite-menu
  Include plugins-compiled
  call dein#local($MY_VIMFILES . '/plugins-local')

  call dein#end()
  call dein#save_state()
endif

call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')

if dein#check_install()
  echo 'install...'
  call dein#install()
endif
