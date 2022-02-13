" - repo: Shougo/neco-vim
" - repo: neoclide/coc-neco
if executable('yarn')
  PluginAdd 'neoclide/coc.nvim', {
        \ 'rev': 'master',
        \ 'on_updated': 'yarn install --frozen-lockfile'
        \ }
  Include /plugins-conf/coc.vim
  function! g:plugin_hooks[SourcedHook()]()
    Include /plugins-conf/coc-sourced.vim
  endfunction
endif

PluginAdd 'github/copilot.vim'
let g:copilot_filetypes = {
      \ '*': v:true
      \ }
