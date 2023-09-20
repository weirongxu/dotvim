let g:vim_plug_manager_hooks = #{source: [], sourced: []}

function! s:add(metadata)
  let repo = a:metadata['repo']
  let name = a:metadata['name']
  let options = {
        \ }
  let keys = [
        \ ['on_cmd', 'on'],
        \ ['on_ft', 'for'],
        \ ['rtp', 'rtp'],
        \ ['on_updated', 'do'],
        \ ['rev', 'commit'],
        \ ['frozen', 'frozen'],
        \ ]
  for key in keys
    let from = key[0]
    let to = key[1]
    if has_key(a:metadata, from)
      let options[to] = a:metadata[from]
    endif
  endfor

  let source_hook = SourceHook(name)
  if has_key(g:plugin_hooks, source_hook)
    call add(g:vim_plug_manager_hooks['source'], g:plugin_hooks[source_hook])
  endif
  let sourced_hook = SourcedHook(name)
  if has_key(g:plugin_hooks, sourced_hook)
    call add(g:vim_plug_manager_hooks['sourced'], g:plugin_hooks[sourced_hook])
  endif

  let cmd = "Plug '" . repo . "'"
  if len(options)
    let cmd .= ', ' . string(options)
  endif
  execute cmd
endfunction

function! s:boot_source_hook()
  for Fn in g:vim_plug_manager_hooks['source']
    call call(Fn, [], {})
  endfor
endfunction

function! s:boot_sourced_hook()
  for Fn in g:vim_plug_manager_hooks['sourced']
    call call(Fn, [], {})
  endfor
endfunction

function! PluginsBootVimPlug()
  let installed_dir = $CACHE . '/vim-plug/'

  call plug#begin(installed_dir)
  for metadata in g:plugin_manager_repos
    call s:add(metadata)
  endfor
  call plug#end()

  call s:boot_source_hook()

  au VimEnter * call s:boot_sourced_hook()
endfunction
