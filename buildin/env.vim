let g:env#nvim = has('nvim')

let g:env#win = has('win32') || has('win64') || has('win95')
let g:env#unix = has('unix')
let g:env#mac = has('mac') || has('macunix')

let g:env#gui = has('gui_running')
let g:env#xterm = match(&term, 'xterm\|256color') != -1
let g:env#screen = &term == 'screen'
let g:env#tmux = &term == 'screen'
let g:env#x = g:env#win || g:env#gui || g:env#xterm || g:env#screen || &term == 'nvim'
let g:env#nerdfont = exists('$NERDFONT')

let g:env#vim8_async = (v:version >= 800 || has('patch-7.4.1829')) && has('job') && has('channel') && has('timers') && has('reltime')
let g:env#async = g:env#vim8_async || g:env#nvim

let g:env#python2 = has('python')
let g:env#python3 = has('python3')
let g:env#python = g:env#python2 || g:env#python3
let g:env#lua = has('lua')
let g:env#ruby = has('ruby')
let g:env#perl = has('perl')
let g:env#tcl = has('tcl')

let g:env#record_dir = $HOME.'/.record/vim'
let g:env#record_dir#sessions = g:env#record_dir.'/sessions'
let g:env#record_dir#defx_sessions = g:env#record_dir.'/defx-sessions'
let g:env#tmp = $MY_VIMFILES . '/tmp'
for dir in [g:env#record_dir#sessions, g:env#record_dir#defx_sessions, g:env#tmp]
  if !isdirectory(dir)
    call mkdir(dir, 'p')
  endif
endfor

let g:github_token_file = expand('~/.record/github-token')

let g:env#html_type_list = [
      \ 'markdown',
      \ 'html',
      \ 'jsp',
      \ 'xhtml',
      \ 'xml',
      \ 'htm',
      \ 'php',
      \ 'aspvbs',
      \ 'mason',
      \ 'htmldjango',
      \ 'blade.php',
      \ 'vue',
      \ 'eruby',
      \ 'liquid',
      \ 'jst',
      \ ]

let g:env#styles_type_list = [
      \ 'css',
      \ 'less',
      \ 'sass',
      \ 'scss',
      \ 'stylus',
      \ ]

let g:env#js_type_list = [
      \ 'javascript',
      \ 'javascript.jsx',
      \ 'coffee',
      \ 'typescript',
      \ ]

let g:env#web_assets_type_list = ['json'] + g:env#html_type_list + g:env#styles_type_list + g:env#js_type_list

let g:env#hidden_ext_list = [
      \ 'so', 'dll', 'o',
      \ 'pyc', 'class',
      \ 'bak',
      \ 'exe',
      \ 'swp',
      \ 'swo',
      \ ]

let g:env#hidden_dir_list = [
      \ '.git', '.svn', '.hg', '.svn', '.bzr', '.ropeproject',
      \ 'node_modules', 'bower_components', 'vendor',
      \ '.DS_Store',
      \ ]

let g:env#hidden_glob_list = map(deepcopy(g:env#hidden_ext_list), '"*.".v:val')
      \ + map(deepcopy(g:env#hidden_dir_list), 'v:val."/**"')

let g:env#hidden_list = map(deepcopy(g:env#hidden_ext_list), '".".v:val') + g:env#hidden_dir_list
