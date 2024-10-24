if g:env#async
  PluginAdd 'lambdalisue/gina.vim'
  cabbr git Gina
  map <Leader>gs <Cmd>Gina status --opener=split<CR>
  map <Leader>gc <Cmd>Gina commit --opener=split<CR>
  map <Leader>gC <Cmd>Gina commit --amend --opener=split<CR>
  map <Leader>gp <Cmd>Gina push<CR>
  noremap <Leader>grb<space> :Gina rebase 
  map <Leader>grbc <Cmd>Gina rebase --continue<CR>
  map <Leader>grbs <Cmd>Gina rebase --skip<CR>
  map <Leader>gl <Cmd>Gina pull --rebase<CR>
  map <Leader>gL <Cmd>Gina pull<CR>
  map <Leader>gh <Cmd>Gina log --all<CR>
  map <Leader>gH <Cmd>Gina log<CR>
  function! g:plugin_hooks[SourcedHook()]()
    function! s:gina_change()
      if exists('#User#CocGitStatusChange')
        doautocmd <nomodeline> User CocGitStatusChange
      endif
    endfunction
    call gina#core#emitter#subscribe('modified', function('s:gina_change'))
    call extend(g:gina#command#browse#translation_patterns, {
     \ 'coding.net': [
     \   [
     \     '\vhttps?://git\.coding\.net/(.{-})/(.{-})%(\.git)?$',
     \     '\vgit://git\.coding\.net\/(.{-})\/(.{-})%(\.git)?$',
     \     '\vgit\@git\.coding\.net:(.{-})\/(.{-})%(\.git)?$',
     \     '\vssh:\/\/git\@git\.coding\.net\/(.{-})\/(.{-})%(\.git)?$',
     \   ], {
     \     '_': 'https://coding.net/u/\1/p/\2/git/blob/%r0/%pt%{#L|}ls%{-L|}le',
     \     'root': 'https://coding.net/u/\1/p/\2/git/tree/%r0/',
     \     'blame': 'https://coding.net/u/\1/p/\2/git/blame/%r0/%pt%{#L|}ls%{-L|}le',
     \     'compare': 'https://coding.net/u/\1/p/\2/git/compare/%c1...%c2',
     \   },
     \ ],
     \})
  endfunction
endif

" PluginAdd 'airblade/vim-gitgutter'
" function! g:plugin_hooks[SourcedHook()]()
"   autocmd BufWritePost * GitGutter
" endfunction

PluginAdd 'cohama/agit.vim', #{on_cmd: ['Agit', 'AgitFile', 'AgitGit']}
let g:agit_stat_width = '1000'

" PluginAdd 'junegunn/gv.vim', #{on_cmd: ['GV', 'GV!', 'GV?']}
" PluginAdd 'mhinz/vim-signify'
" PluginAdd 'rhysd/committia.vim'
" PluginAdd 'tpope/vim-fugitive'
" PluginAdd 'jaxbot/github-issues.vim', #{on_cmd: ['Gissues', 'Giadd', 'Giedit', 'Giupdate', 'Gmiles']}
" if filereadable(g:github_token_file)
"   let g:github_access_token = strpart(join(readfile(g:github_token_file), ""), 6)
" endif
