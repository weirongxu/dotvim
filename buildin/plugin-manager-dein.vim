function! s:add(metadata, inner_dir)
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
        \ 'path',
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

  if a:metadata['inner']
    call dein#local(a:inner_dir, options, [repo])
  elseif a:metadata['local']
    let dir = fnamemodify(repo, ':h')
    let a:metadata['path'] = repo
    call dein#local(dir, options, [name])
  else
    call dein#add(repo, options)
  endif
endfunction


function! PluginsBootDein(inner_dir)
  let $DEIN_DIR = $HOME . '/.cache/dein'
  let &runtimepath .= ','.$DEIN_DIR.'/repos/github.com/Shougo/dein.vim'
  let g:dein#types#git#clone_depth = 1

  call dein#begin($DEIN_DIR)
  call dein#add('Shougo/dein.vim')
  call dein#add('haya14busa/dein-command.vim')
  for metadata in g:coc_plugin_repos
    call s:add(metadata, a:inner_dir)
  endfor
  call dein#end()

  call dein#call_hook('source')
  autocmd VimEnter * call dein#call_hook('post_source')

  if dein#check_install()
    echo 'install...'
    call dein#install()
  endif
endfunction
