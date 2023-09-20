Include plugin-manager/dein.vim
Include plugin-manager/vim-plug.vim

let g:plugin_manager_repos = []
let g:plugin_hooks = {}

let s:inner_repos_dir = $MY_VIMFILES.'/plugins/inner'
let s:current_plugin = {}
let s:dev_repos_dir = expand('~/repos/vim')
let s:dev_repos = isdirectory(s:dev_repos_dir) ? readdir(s:dev_repos_dir) : []

function! SourceHook(...)
  let name = get(a:000, 0, s:current_plugin['name'])
  return 'source_'. substitute(name, '[-.]', '_', 'g')
endfunction

function! SourcedHook(...)
  let name = get(a:000, 0, s:current_plugin['name'])
  return 'sourced_'. substitute(name, '[-.]', '_', 'g')
endfunction

" @example
" ```
" PluginAdd 'repo.vim', #{
"   \  inner: 1,            " Load plugin from .vim/plugins/inner
"   \  dev: 1,              " Load plugin from ~/repos/vim
"   \  on_map: '<Leader>t', " Or ['<Leader>t']
"   \  on_cmd: 'Run',       " Or ['Run']
"   \  on_ft: 'vim',        " Or ['vim']
"   \  on_updated: 'make',  " Execute a shell command after plugin updated
"   \  rtp: 'vim/',         " Specify the runtime subdirectory path at repo.
"   \  rev: 'ca0ae0a',      " Git sha rev
"   \  frozen: 1,           " Do not update
"   \}
" ```
function! PluginAdd(repo, ...)
  let opt = get(a:000, 0, {})
  let repo = a:repo
  let name = fnamemodify(repo, ":t")
  let s:current_plugin = {
        \ 'repo': repo,
        \ 'inner': v:false,
        \ 'dev': v:false,
        \ 'name': name,
        \ }
  let optkeys = [
        \ 'inner',
        \ 'dev',
        \ 'on_map',
        \ 'on_cmd',
        \ 'on_ft',
        \ 'on_updated',
        \ 'rtp',
        \ 'rev',
        \ 'frozen',
        \ ]
  for optkey in optkeys
    if has_key(opt, optkey)
      let s:current_plugin[optkey] = opt[optkey]
    endif
  endfor
  if s:current_plugin['inner']
    let s:current_plugin['repo'] = s:inner_repos_dir . '/' . repo
    if !isdirectory(s:current_plugin['repo'])
      return
    endif
  elseif s:current_plugin['dev']
    if type(s:current_plugin['dev']) == type('')
      let s:current_plugin['repo'] = s:current_plugin['dev']
      if !isdirectory(s:current_plugin['repo'])
        return
      endif
    elseif count(s:dev_repos, name)
      let s:current_plugin['repo'] = s:dev_repos_dir . '/' . name
      " if !isdirectory(s:current_plugin['repo'])
      "   return
      " endif
    endif
  endif
  call add(g:plugin_manager_repos, s:current_plugin)
endfunction

command! -nargs=1 PluginAdd call PluginAdd(<args>)

function! PluginsBoot(type)
  if a:type == 'dein.vim'
    call PluginsBootDein()
  elseif a:type == 'vim-plug'
    call PluginsBootVimPlug()
  endif
  delcommand PluginAdd
endfunction
