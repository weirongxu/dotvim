PluginAdd 'beloglazov/vim-online-thesaurus', {'on_cmd': 'OnlineThesaurusCurrentWord'}
let g:online_thesaurus_map_keys = 0
function! g:plugin_hooks[SourcedHook()]()
  call AddCommand('OnlineThesaurusCurrentWord', 'OnlineThesaurusCurrentWord')
endfunction

PluginAdd 'rhysd/vim-grammarous', {'on_cmd': 'GrammarousCheck'}
