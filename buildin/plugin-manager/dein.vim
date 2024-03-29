function! s:add(metadata)
  let repo = a:metadata['repo']
  let name = a:metadata['name']
  let options = {
        \ 'merged': 0,
        \ }
  let keys = [
        \ 'on_map',
        \ 'on_cmd',
        \ 'on_ft',
        \ 'rtp',
        \ 'rev',
        \ 'frozen',
        \ ]
  for key in keys
    if has_key(a:metadata, key)
      let options[key] = a:metadata[key]
    endif
  endfor

  if has_key(a:metadata, 'on_updated')
    if type(a:metadata['on_updated']) == type('')
      let options['build'] = a:metadata['on_updated']
    else
      let options['hook_post_update'] = a:metadata['on_updated']
    endif
  endif

  let source_hook = SourceHook(name)
  let options['hook_source'] = 'if has_key(g:plugin_hooks, "' . source_hook . '") | call g:plugin_hooks["' . source_hook . '"]() | end'

  let sourced_hook = SourcedHook(name)
  let options['hook_post_source'] = 'if has_key(g:plugin_hooks, "' . sourced_hook . '") | call g:plugin_hooks["' . sourced_hook . '"]() | end'

  call dein#add(repo, options)
endfunction


function! PluginsBootDein()
  " install
  if &runtimepath !~# '/dein.vim'
    let s:dein_dir = fnamemodify('dein.vim', ':p')
    if !isdirectory(s:dein_dir)
      let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
      if !isdirectory(s:dein_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
      endif
    endif
    execute 'set runtimepath^=' . substitute(
          \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
  endif

  let $DEIN_DIR = $CACHE . '/dein'
  let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
  let g:dein#types#git#clone_depth = 1

  call dein#begin($DEIN_DIR)
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  for metadata in g:plugin_manager_repos
    call s:add(metadata)
  endfor
  call dein#end()

  call dein#call_hook('source')
  autocmd VimEnter * call dein#call_hook('post_source')

  if dein#check_install()
    echo 'install...'
    call dein#install()
  endif
endfunction
