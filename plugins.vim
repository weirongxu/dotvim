let $DEIN_DIR = $HOME . '/.cache/dein'

if ! &loadplugins
  finish
end

let no_plugin_maps = 1
Include plugins/index.vim
call PluginsBoot('dein.vim', $MY_VIMFILES.'/plugins/inner')
