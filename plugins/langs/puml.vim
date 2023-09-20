PluginAdd 'weirongxu/plantuml-previewer.vim', #{dev: 1}
" path: /home/raidou/projects/plantuml-previewer.vim
let g:plantuml_previewer#save_format = 'svg'
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = get(
      \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
      \  1,
      \  0
      \)

PluginAdd 'aklt/plantuml-syntax'
