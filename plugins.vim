let $DEIN_DIR = $HOME . '/.cache/dein'
let s:plugins_dir = $MY_VIMFILES.'/plugins'
let s:plugins_index = s:plugins_dir.'/index.rc.yml'
let s:plugins_local_dir = $MY_VIMFILES.'/plugins-local'
let s:plugins_manager_type = 'dein.vim'
let s:plugins_compiled = $MY_VIMFILES.'/plugins-compiled.vim'

" let g:node_client_debug = 1
" let $NODE_CLIENT_LOG_FILE = $HOME . '/tmp/coc-logfile.log'

if ! &loadplugins
  finish
end

let no_plugin_maps = 1

let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
let g:dein#types#git#clone_depth = 1

let g:coc_node_args = ['--nolazy']
" let g:coc_node_args = ['--nolazy', '--async-stack-traces', '--inspect-brk=6045']
let updated = CheckPluginsUpdated(s:plugins_local_dir, s:plugins_dir, s:plugins_index, s:plugins_compiled, s:plugins_manager_type)

" if ! updated || dein#load_state($DEIN_DIR)
call dein#begin($DEIN_DIR, [$PLUGINS_COMPILED])

Include plugins-compiled
" call dein#local($MY_VIMFILES . '/plugins-local')

call dein#end()
"   call dein#save_state()
" endif


call dein#call_hook('source')
autocmd VimEnter * call dein#call_hook('post_source')


if dein#check_install()
  echo 'install...'
  call dein#install()
endif
