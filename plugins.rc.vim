let $DEIN_DIR = $HOME . '/.cache/dein'
let s:plugins_dir = $MY_VIMFILES.'/plugins'
let s:plugins_source = s:plugins_dir.'/index.rc.yml'
let s:plugins_manager_type = 'dein.vim'
let s:plugins_compiled = $MY_VIMFILES.'/plugins-compiled.rc.vim'

if ! &loadplugins
  finish
end

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1

let updated = CheckPluginsUpdated(s:plugins_dir, s:plugins_source, s:plugins_manager_type, s:plugins_compiled)

" if ! updated || dein#load_state($DEIN_DIR)
call dein#begin($DEIN_DIR, [$PLUGINS_COMPILED])

Include plugins-compiled
call dein#local($MY_VIMFILES . '/plugins-local')

call dein#end()
"   call dein#save_state()
" endif


call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')


if dein#check_install()
  echo 'install...'
  call dein#install()
endif
