let $DEIN_DIR = $HOME . '/.cache/dein'
let $PLUGINS_COMPILED = $MY_VIMFILES.'/plugins-compiled.rc.vim'

if ! &loadplugins
  finish
end

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1
Include plugins-convert
Include plugins-conf/unite-menu

if dein#load_state($DEIN_DIR)
  call dein#begin($DEIN_DIR, [$PLUGINS_COMPILED])

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
