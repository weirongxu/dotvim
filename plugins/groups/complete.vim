" - repo: Shougo/neco-vim
" - repo: neoclide/coc-neco
if executable('npm')
  PluginAdd 'neoclide/coc.nvim', #{
        \   rev: 'master',
        \   dev: 1,
        \   on_updated: 'npm ci'
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

"if g:env#nvim
"  PluginAdd 'nvim-treesitter/nvim-treesitter'
"  PluginAdd 'stevearc/dressing.nvim'
"  PluginAdd 'nvim-lua/plenary.nvim'
"  PluginAdd 'MunifTanjim/nui.nvim'
"  PluginAdd 'MeanderingProgrammer/render-markdown.nvim'
"  PluginAdd 'yetone/avante.nvim', #{ rev: 'main', on_updated: 'make' }
"  function! s:setup_avante()
"    lua<<EOF
"    require('avante').setup({
"      -- add any opts here
"      -- for example
"      provider = "ollama",
"      auto_suggestions_provider = "ollama",
"      ollama = {
"        endpoint = "http://172.17.0.1:11434",
"        model = "qwen2.5-coder:1.5b-base",
"      },
"      behaviour = {
"        auto_suggestions = true, -- Experimental stage
"      },
"    })
"EOF
"  endfunction
"  function! g:plugin_hooks[SourcedHook()]()
"    call s:setup_avante()
"  endfunction
"endif
