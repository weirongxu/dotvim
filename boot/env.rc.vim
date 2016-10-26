let g:env#nvim = has('nvim')

let g:env#win = has('win32') || has('win64') || has('win95')
let g:env#unix = has('unix')
let g:env#mac = has('mac') || has('macunix')

let g:env#gui = has('gui_running')
let g:env#xterm = &term == 'xterm'
let g:env#screen = &term == 'screen'
let g:env#tmux = &term == 'screen'
let g:env#x = g:env#gui || g:env#xterm || g:env#screen


let g:env#python2 = has('python')
let g:env#python3 = has('python3')
let g:env#python = g:env#python2 || g:env#python3
let g:env#lua = has('lua')
let g:env#ruby = has('ruby')
let g:env#perl = has('perl')
let g:env#tcl = has('tcl')

let g:env#tmp = g:env#win ? $TMP : expand('~/tmp')
if !isdirectory(g:env#tmp)
  call mkdir(g:env#tmp)
endif



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
      \ 'coffee',
      \ 'typescript'
      \ ]

let g:env#web_assets_type_list = ['json'] + g:env#html_type_list + g:env#styles_type_list + g:env#js_type_list
