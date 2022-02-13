PluginAdd 'weirongxu/yiiprado.vim'
autocmd BufNewFile,BufRead *.tpl setfiletype yiiprado

PluginAdd 'stephpy/vim-phpdoc', {'on_ft': g:env#html_type_list}
function! g:plugin_hooks[SourcedHook()]()
  nmap <buffer> <Leader>8 <Cmd>call PhpDocSingle()<CR>
  vmap <buffer> <Leader>8 <Cmd>call PhpDocRange()<CR>
endfunction

PluginAdd 'php-cs-fixer', {'inner': 1}
function! g:plugin_hooks[SourcedHook()]() abort
  call AddCommand('php-fixer', 'PhpFixer')
endfunction
