PluginAdd 'Shougo/context_filetype.vim'
Include /plugins-conf/context_filetype.vim

PluginAdd 'blindFS/vim-regionsyntax'
let g:regionsyntax_map = {
   \ 'markdown': [
   \   {
   \     'ft' : 'text',
   \     'start' : '\$',
   \     'end' : '\$'
   \   },
   \   {
   \     'ft' : 'text',
   \     'start' : '\$\$',
   \     'end' : '\$\$'
   \   },
   \ ],
   \}
