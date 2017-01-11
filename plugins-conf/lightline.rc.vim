let g:lightline_component = {
      \   'obj': {},
      \   'obj_idx': 0,
      \   'middle_width': 70,
      \   'proptoype': {
      \     'fn_idx': 0,
      \     'func_name': '',
      \     'var_name': '',
      \     'exec_str': '',
      \     'conditions': [],
      \     'wrap_list': ['', ''],
      \   },
      \ }

" new(default='')
function! g:lightline_component.new(...) "{{{
  let cm = deepcopy(self.proptoype)
  let cm.class = self
  let cm.obj_idx = self.obj_idx
  let self.obj[self.obj_idx] = cm
  let self.obj_idx = self.obj_idx + 1

  let cm.default = get(a:, 1, '')
  return cm
endfunction "}}}

" generate anonymous function
function! g:lightline_component.proptoype.fn(body) "{{{
  let self.fn_idx = self.fn_idx + 1
  let fn_name = 'anonymous_'. self.fn_idx
  if type(a:body) == type('')
      let fn_body = a:body
  elseif type(a:body) == type([])
      let fn_body = join(a:body, "\n")
  endif
  exec 'function! self.' . fn_name . "()\n" . fn_body . "\n" . 'endfunction'
  return self[fn_name]
endfunction "}}}

" component from func
" example:
"   s:c().func('virtualenv#statusline')
function! g:lightline_component.proptoype.func(name, ...) "{{{
  let self.func_name = a:name

  let self.exec_str = '%f()'
  call insert(self.conditions, self.fn('return exists("*'.a:name.'")'))
  return self
endfunction "}}}

" component from if func
" example:
"   s:c().if_func('virtualenv#statusline', 'statusline return true')
function! g:lightline_component.proptoype.if_func(name, text) "{{{
  let self.func_name = a:name

  let self.exec_str = '(%f()?"'.a:text.'":"")'
  call insert(self.conditions, self.fn('return exists("*'.a:name.'")'))
  return self
endfunction "}}}

" component from variable
" example:
"   s:c().var('g:ibus#enabled')
function! g:lightline_component.proptoype.var(name, ...) "{{{
  let self.var_name = a:name

  let value = get(a:, 1, '')
  if value == ''
    let self.exec_str = '%v'
  else
    let self.exec_str = '(%v?"'.value.'":"")'
  endif
  call insert(self.conditions, self.fn('return exists("'.a:name.'")'))
  return self
endfunction "}}}

" component from variable
" example:
"   s:c().func('virtualenv#statusline').default('[default]')
" or:
"   s:c('[default]').func('virtualenv#statusline')
function! g:lightline_component.proptoype.default(default) "{{{
  let self.default = default
  return self
endfunction "}}}

" when winwidth greater then middle_width
" example:
"   s:c().func('virtualenv#statusline').large()
function! g:lightline_component.proptoype.large(...) "{{{
  let num = get(a:, 1, self.class.middle_width)
  call insert(self.conditions, self.fn('return winwidth(0) > ' . num))
  return self
endfunction "}}}

" when winwidth less then middle_width
" example:
"   s:c().func('virtualenv#statusline').small()
function! g:lightline_component.proptoype.small() "{{{
  let num = get(a:, 1, self.class.middle_width)
  call insert(self.conditions, self.fn('return winwidth(0) <= ' . num))
  return self
endfunction "}}}

" wrap lightline component
" example:
"   s:c().func('virtualenv#statusline').wrap('[', ']')
function! g:lightline_component.proptoype.wrap(...) "{{{
  let lwrap = get(a:, 1, '')
  let rwrap = get(a:, 2, lwrap)
  let self.wrap_list = [lwrap, rwrap]
  return self
endfunction "}}}

" wrap lightline component
" example:
"   s:c().func('virtualenv#statusline').wrap('[', ']')
function! g:lightline_component.proptoype.exec(s) "{{{
  let self.exec_str = a:s
  return self
endfunction "}}}

function! g:lightline_component.proptoype.real_render() "{{{
  for Condition in self.conditions
    if ! call(Condition, [], self)
      return self.default
    endif
  endfor

  let exec_str = self.exec_str
  let exec_str = substitute(exec_str, '%f', self.func_name, '')
  let exec_str = substitute(exec_str, '%v', self.var_name, '')
  exec 'let ret = ' . exec_str
  if ret == ''
    return self.default
  else
    return self.wrap_list[0] . ret . self.wrap_list[1]
  endif
endfunction "}}}

function! g:lightline_component.proptoype.render(...) "{{{
  return 'g:lightline_component.obj['.self.obj_idx.'].real_render'
endfunction "}}}

" new lightline_component
function! s:c(...) "{{{
  return call(g:lightline_component.new, a:000, g:lightline_component)
endfunction "}}}

let g:lightline = {
      \   'colorscheme': 'jellybeans',
      \   'active': {
      \     'left': [
      \       ['mode', 'paste'],
      \       ['git_branch', 'git_traffic', 'git_status'],
      \       ['virtualenv'],
      \       ['ibus'],
      \       ['readonly', 'filename', 'modified'],
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       ['noscrollbar'],
      \       ['fileformat', 'fileencoding', 'filetype'],
      \     ],
      \   },
      \   'inactive': {
      \     'left': [
      \       ['filename'],
      \     ],
      \     'right': [
      \       ['lineinfo'],
      \       ['percent'],
      \       ['absolutepath'],
      \     ],
      \   },
      \   'tab': {
      \     'active': [
      \       'modified',
      \       'filename',
      \     ],
      \     'inactive': [
      \       'modified',
      \       'filename',
      \     ],
      \   },
      \   'tabline': {
      \     'right': [ ['close'], ['fixdir'] ],
      \   },
      \   'component_function': {
      \     'virtualenv':  s:c().func('virtualenv#statusline').wrap('[', ']').large().render(),
      \     'noscrollbar': s:c().func('g:lightline.my.noscrollbar').render(),
      \     'fixdir':      s:c().if_func('fixdir#started', 'FD').render(),
      \     'ibus':        s:c().var('g:ibus#enabled', 'ZH').large().render(),
      \     'fugitive':    s:c().func('fugitive#head').large().render(),
      \     'git_branch':  s:c().func('g:lightline.my.git_branch').large().render(),
      \     'git_traffic': s:c().func('g:lightline.my.git_traffic').large().render(),
      \     'git_status':  s:c().func('g:lightline.my.git_status').large().render(),
      \   },
      \   'subseparator': { 'left': '', 'right': '' },
      \ }

let g:lightline.my = {}

function! g:lightline.my.noscrollbar()
  if exists('*noscrollbar#statusline') && (winwidth(0) > g:lightline_component.middle_width)
    return noscrollbar#statusline()
  else
    return line('.') * 100 / line('$') . '%'
  endif
endfunction

function! g:lightline.my.git_branch() dict " {{{
  return gita#statusline#preset('branch')
endfunction " }}}

function! g:lightline.my.git_traffic() dict " {{{
  return gita#statusline#preset('traffic')
endfunction " }}}

function! g:lightline.my.git_status() dict " {{{
  return gita#statusline#preset('status')
endfunction " }}}
