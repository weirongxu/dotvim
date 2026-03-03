"PluginAdd 'NickvanDyke/opencode.nvim'
"
"nmap <silent> + :lua require("opencode").ask("@this: ", { submit = true })<CR>
"nmap <silent> - :lua require("opencode").prompt("@this: ")<CR>
"
"nmap <silent> go :lua return require("opencode").operator("@this ")<CR>
"nmap <silent> goo :lua return require("opencode").operator("@this ") .. "_"<CR>
"nmap <silent> <C-9> :lua require("opencode").command("session.half.page.up")<CR>
"nmap <silent> <C-0> :lua require("opencode").command("session.half.page.down")<CR>

if g:env#nvim
  PluginAdd 'folke/snacks.nvim'
  PluginAdd 'coder/claudecode.nvim'
  function! g:plugin_hooks[SourcedHook()]()
    lua require('claudecode').setup({
          \   git_repo_cwd = true,
          \   terminal = {
          \     provider = "none",
          \     split_side = "right",
          \     split_width_percentage = 0.5,
          \   }
          \ })
    " ClaudeCode mappings
    nnoremap <leader>ac <cmd>ClaudeCode<CR>
    nnoremap <leader>af <cmd>ClaudeCodeFocus<CR>
    nnoremap <leader>ar <cmd>ClaudeCode --resume<CR>
    nnoremap <leader>aC <cmd>ClaudeCode --continue<CR>
    nnoremap <leader>am <cmd>ClaudeCodeSelectModel<CR>
    nnoremap <leader>ab <cmd>ClaudeCodeAdd %<CR>
    xnoremap <leader>as <cmd>ClaudeCodeSend<CR>
    nnoremap <leader>aa <cmd>ClaudeCodeDiffAccept<CR>
    nnoremap <leader>ad <cmd>ClaudeCodeDiffDeny<CR>
    function! s:claudecode_in_tab() abort
      tabnew
      ClaudeCode
      wincmd o
    endfunction
    nnoremap <leader>at <cmd>call <SID>claudecode_in_tab()<CR>
  endfunction
endif
