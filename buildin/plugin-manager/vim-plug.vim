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
    call add(g:vim_plug_manager_hooks['source'], #{name: name, fn: g:plugin_hooks[source_hook]})
  endif
  let sourced_hook = SourcedHook(name)
  if has_key(g:plugin_hooks, sourced_hook)
    call add(g:vim_plug_manager_hooks['sourced'], #{name: name, fn: g:plugin_hooks[sourced_hook]})
  endif

  let cmd = "Plug '" . repo . "'"
  if len(options)
    let cmd .= ', ' . string(options)
  endif
  execute cmd
endfunction

function! s:boot_source_hook()
  for hook in g:vim_plug_manager_hooks['source']
    if has_key(g:plugs, hook['name'])
      call call(hook['fn'], [], {})
    endif
  endfor
endfunction

function! s:rtp(spec)
  return s:path(a:spec.dir . get(a:spec, 'rtp', ''))
endfunction

if g:env#win
  function! s:path(path)
    return s:trim(substitute(a:path, '/', '\', 'g'))
  endfunction
else
  function! s:path(path)
    return s:trim(a:path)
  endfunction
endif

function! s:trim(str)
  return substitute(a:str, '[\/]\+$', '', '')
endfunction

function! s:split_rtp()
  return split(&rtp, '\\\@<!,')
endfunction

function! s:register_sourced_hook()
  let rtps = s:split_rtp()
  for [i, hook] in items(g:vim_plug_manager_hooks['sourced'])
    if has_key(g:plugs, hook['name'])
      let rtp = s:rtp(g:plugs[hook['name']])
      if index(rtps, rtp)
        execute 'autocmd VimEnter * call <SID>boot_sourced_hook(' . i . ')'
        continue
      endif
    endif
    execute 'autocmd User' hook['name'] 'call <SID>boot_sourced_hook(' . i . ')'
    "call call(hook['fn'], [], {})
  endfor
endfunction

function! s:boot_sourced_hook(index)
  echom a:index
  let hook = g:vim_plug_manager_hooks['sourced'][a:index]
  call call(hook['fn'], [], {})
endfunction

function! s:setup_extra()
  " gx open on browser
  function! s:plug_gx()
    let line = getline('.')
    let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
    let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
          \ : getline(search('^- .*:$', 'bn'))[2:-2]
    let uri  = get(get(g:plugs, name, {}), 'uri', '')
    if uri !~ 'github.com'
      return
    endif
    let repo = matchstr(uri, '[^:/]*/'.name)
    let url  = empty(sha) ? 'https://github.com/'.repo
          \ : printf('https://github.com/%s/commit/%s', repo, sha)
    call netrw#BrowseX(url, 0)
  endfunction

  augroup PlugGx
    autocmd!
    autocmd FileType vim-plug nnoremap <buffer> <silent> gx :call <sid>plug_gx()<cr>
  augroup END

  " gd open directory
  function! s:plug_gd()
    let line = getline('.')
    let sha  = matchstr(line, '^  \X*\zs\x\{7,9}\ze ')
    let name = empty(sha) ? matchstr(line, '^[-x+] \zs[^:]\+\ze:')
          \ : getline(search('^- .*:$', 'bn'))[2:-2]
    let dir  = get(get(g:plugs, name, {}), 'dir', '')
    execute 'edit ' . dir
  endfunction

  augroup PlugGd
    autocmd!
    autocmd FileType vim-plug nnoremap <buffer> <silent> gd :call <sid>plug_gd()<cr>
  augroup END

  " diff
  function! s:scroll_preview(down)
    silent! wincmd P
    if &previewwindow
      execute 'normal!' a:down ? "\<c-e>" : "\<c-y>"
      wincmd p
    endif
  endfunction

  function! s:setup_extra_diff_keys()
    nnoremap <silent> <buffer> J :call <sid>scroll_preview(1)<cr>
    nnoremap <silent> <buffer> K :call <sid>scroll_preview(0)<cr>
    nnoremap <silent> <buffer> <c-n> :call search('^  \X*\zs\x')<cr>
    nnoremap <silent> <buffer> <c-p> :call search('^  \X*\zs\x', 'b')<cr>
    nmap <silent> <buffer> <c-j> <c-n>o
    nmap <silent> <buffer> <c-k> <c-p>o
  endfunction

  augroup PlugDiffExtra
    autocmd!
    autocmd FileType vim-plug call s:setup_extra_diff_keys()
  augroup END
endfunction

function! PluginsBootVimPlug()
  let installed_dir = $CACHE . '/vim-plug/'

  call plug#begin(installed_dir)
  for metadata in g:plugin_manager_repos
    call s:add(metadata)
  endfor
  call plug#end()

  call s:boot_source_hook()
  call s:register_sourced_hook()

  " auto install
  autocmd VimEnter *
        \  if len(filter(values(g:plugs), {i, plug -> !isdirectory(plug.dir)}))
        \|   PlugInstall --sync | q
        \| endif

  call s:setup_extra()
endfunction
