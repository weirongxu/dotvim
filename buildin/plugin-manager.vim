Include plugin-manager/dein.vim

let g:coc_plugin_repos = []
let g:plugin_hooks = {}

let s:inner_repos_dir = $MY_VIMFILES.'/plugins/inner'
let s:current_plugin = {}
let s:dev_repos_dir = expand('~/repos/vim')
let s:dev_repos = readdir(s:dev_repos_dir)

function! SourcedHook(...)
  let name = get(a:000, 0, s:current_plugin['name'])
  return 'sourced_'. substitute(name, '[-.]', '_', 'g')
endfunction

function! SourceHook(...)
  let name = get(a:000, 0, s:current_plugin['name'])
  return 'source_'. substitute(name, '[-.]', '_', 'g')
endfunction

function! PluginAdd(repo, ...)
  let opt = get(a:000, 0, {})
  let repo = a:repo
  let name = fnamemodify(repo, ":t")
  let s:current_plugin = {
        \ 'repo': repo,
        \ 'inner': v:false,
        \ 'local': v:false,
        \ 'dev': v:false,
        \ 'name': name,
        \ }
  let optkeys = [
    \ 'inner',
    \ 'local',
    \ 'dev',
    \ 'on_map',
    \ 'on_cmd',
    \ 'on_ft',
    \ 'on_updated',
    \ 'rtp',
    \ 'path',
    \ 'rev',
    \ 'frozen',
    \ ]
  for optkey in optkeys
    if has_key(opt, optkey)
      let s:current_plugin[optkey] = opt[optkey]
    end
  endfor
  if s:current_plugin['inner']
    let s:current_plugin['local'] = v:true
    let s:current_plugin['repo'] = s:inner_repos_dir . '/' . repo
  elseif s:current_plugin['dev']
    if type(s:current_plugin['dev']) == type('')
      let s:current_plugin['local'] = v:true
      let s:current_plugin['repo'] = s:current_plugin['dev']
    elseif count(s:dev_repos, name)
      let s:current_plugin['local'] = v:true
      let s:current_plugin['repo'] = s:dev_repos_dir . '/' . name
    endif
  endif
  call add(g:coc_plugin_repos, s:current_plugin)
endfunction

command! -nargs=1 PluginAdd call PluginAdd(<args>)

function! PluginsBoot(type)
  if a:type == 'dein.vim'
    call PluginsBootDein()
  endif
endfunction
