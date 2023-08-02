" - repo: Shougo/neco-vim
" - repo: neoclide/coc-neco
if executable('yarn')
  PluginAdd 'neoclide/coc.nvim', {
        \ 'rev': 'master',
        \ 'dev': 1,
        \ 'on_updated': 'yarn install --frozen-lockfile'
        \ }
  TryInclude /plugins-conf/coc-dev.vim
  Include /plugins-conf/coc.vim
  function! g:plugin_hooks[SourcedHook()]()
    Include /plugins-conf/coc-sourced.vim
    TryInclude /plugins-conf/coc-dev-sourced.vim
  endfunction
endif

" PluginAdd 'github/copilot.vim'
" let g:copilot_filetypes = {
"      \ '*': v:true
"      \ }
