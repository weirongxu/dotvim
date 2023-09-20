if ! &loadplugins
  finish
end

let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

let no_plugin_maps = 1

Include plugins/index.vim
" call PluginsBoot('dein.vim')
call PluginsBoot('vim-plug')
