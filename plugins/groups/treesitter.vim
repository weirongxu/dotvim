if g:env#nvim && executable('gcc')
  PluginAdd 'nvim-treesitter/nvim-treesitter', #{build: 'TSUpdate'}
  function! g:plugin_hooks[SourcedHook()]()
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
      ensure_installed = "all",
      highlight = {
        enable = true,
      }
    }
EOF
  endfunction

  PluginAdd 'nvim-treesitter/nvim-treesitter-refactor'
  function! g:plugin_hooks[SourcedHook()]()
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
      refactor = {
        highlight_definitions = { enable = true },
        smart_rename = {
          enable = true,
          keymaps = {
            smart_rename = "gtrn",
          },
        },
        navigation = {
          enable = true,
          keymaps = {
            goto_definition = "gtd",
            list_definitions = "gtD",
            list_definitions_toc = "gtO",
            goto_next_usage = "<a-*>",
            goto_previous_usage = "<a-#>",
          },
        },
      },
    }
EOF
  endfunction

  PluginAdd 'nvim-treesitter/nvim-treesitter-textobjects'
  function! g:plugin_hooks[SourcedHook()]()
    lua <<EOF
    require'nvim-treesitter.configs'.setup {
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ["a<space>f"] = "@function.outer",
            ["i<space>f"] = "@function.inner",
            ["a<space>c"] = "@class.outer",
            ["i<space>c"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          -- swap_next = {
          --   ["gh"] = "@parameter.inner",
          -- },
          -- swap_previous = {
          --   ["gl"] = "@parameter.inner",
          -- },
        },
      },
    }
EOF
  endfunction

  PluginAdd 'romgrk/nvim-treesitter-context'

  PluginAdd 'nvim-treesitter/playground'
endif
