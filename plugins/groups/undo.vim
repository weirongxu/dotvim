PluginAdd 'mbbill/undotree', #{
      \ on_cmd: [
      \   'UndotreeToggle',
      \   'UndotreeFocus',
      \   'UndotreeShow',
      \   'UndotreeHide',
      \ ]}
command! Undotree UndotreeToggle
