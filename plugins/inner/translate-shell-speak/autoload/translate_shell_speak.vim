let s:Job = vital#vital#import('System.Job')
let s:Process = vital#vital#import('System.Process')
let s:Buffer = vital#vital#import('Vim.Buffer')

function! translate_shell_speak#speak(str) abort
  let cmds = [
        \ 'trans',
        \ '-b',
        \ '-speak',
        \ a:str,
        \]
  if s:Job.is_available()
    call s:Job.start(cmds)
  else
    try
      call s:Process.execute(cmds, {
            \ 'background': 1,
            \})
    catch
      call s:Process.execute(cmds)
    endtry
  endif
endfunction

function! translate_shell_speak#speak_cursor_work() abort
  call translate_shell_speak#speak(expand('<cword>'))
endfunction

function! translate_shell_speak#speak_visual() range abort
  call translate_shell_speak#speak(s:Buffer.get_last_selected())
endfunction
