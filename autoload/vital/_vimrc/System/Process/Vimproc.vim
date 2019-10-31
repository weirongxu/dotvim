" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not modify the code nor insert new lines before '" ___vital___'
function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction
execute join(['function! vital#_vimrc#System#Process#Vimproc#import() abort', printf("return map({'_vital_depends': '', 'execute': '', 'is_supported': '', 'is_available': '', '_vital_loaded': ''}, \"vital#_vimrc#function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
delfunction s:_SID
" ___vital___
let s:save_cpoptions = &cpoptions
set cpoptions&vim

function! s:_vital_loaded(V) abort
  let s:Prelude = a:V.import('Prelude')
endfunction

function! s:_vital_depends() abort
  return [
        \ 'Prelude',
        \]
endfunction

function! s:is_available() abort
  if exists('s:vimproc_available')
    return s:vimproc_available
  endif
  try
    call vimproc#version()
    let s:vimproc_available = 1
  catch
    let s:vimproc_available = 0
  endtry
  return s:vimproc_available
endfunction

function! s:is_supported(options) abort
  if get(a:options, 'background') && (
        \   s:Prelude.is_string(get(a:options, 'input')) ||
        \   get(a:options, 'timeout')
        \)
    return 0
  endif
  return 1
endfunction

function! s:execute(args, options) abort
  let cmdline = join(map(
        \ copy(a:args),
        \ 'vimproc#shellescape(v:val)',
        \))
  if a:options.debug > 0
    echomsg printf(
          \ 'vital: System.Process.Vimproc: %s',
          \ cmdline
          \)
  endif
  if a:options.background
    let output = vimproc#system_bg(cmdline)
    " NOTE:
    " background process via Builtin always return exit_code:0 so mimic
    let status = 0
  else
    let output = vimproc#system(
          \ cmdline,
          \ s:Prelude.is_string(a:options.input) ? a:options.input : '',
          \ a:options.timeout,
          \)
    let status = vimproc#get_last_status()
  endif
    " NOTE:
    " status, output are COMMON information
    " errormsg, cmdline are EXTRA information
  return {
        \ 'status': status,
        \ 'output': output,
        \ 'errormsg': vimproc#get_last_errmsg(),
        \ 'cmdline': cmdline,
        \}
endfunction

let &cpoptions = s:save_cpoptions
unlet s:save_cpoptions
