" ___vital___
" NOTE: lines between '" ___vital___' is generated by :Vitalize.
" Do not mofidify the code nor insert new lines before '" ___vital___'
function! s:_SID() abort
  return matchstr(expand('<sfile>'), '<SNR>\zs\d\+\ze__SID$')
endfunction
execute join(['function! vital#_vimrc#System#Job#Vim#import() abort', printf("return map({'is_available': '', 'start': ''}, \"vital#_vimrc#function('<SNR>%s_' . v:key)\")", s:_SID()), 'endfunction'], "\n")
delfunction s:_SID
" ___vital___
" https://github.com/neovim/neovim/blob/f629f83/src/nvim/event/process.c#L24-L26
let s:KILL_TIMEOUT_MS = 2000

function! s:is_available() abort
  return !has('nvim') && has('patch-8.0.0027')
endfunction

function! s:start(args, options) abort
  let job = extend(copy(s:job), a:options)
  let job_options = {
        \ 'mode': 'raw',
        \ 'timeout': 0,
        \}
  if has_key(job, 'on_stdout')
    let job_options.out_cb = function('s:_out_cb', [job])
  else
    let job_options.out_io = 'null'
  endif
  if has_key(job, 'on_stderr')
    let job_options.err_cb = function('s:_err_cb', [job])
  else
    let job_options.err_io = 'null'
  endif
  if has_key(job, 'on_stdout') || has_key(job, 'on_stderr')
    let job_options.close_cb = function('s:_close_cb', [job])
  endif
  if has_key(job, 'on_exit')
    let job_options.exit_cb = function('s:_exit_cb', [job])
  endif
  let job.__job = job_start(a:args, job_options)
  let job.__closed = v:false
  let job.args = a:args
  return job
endfunction

function! s:_out_cb(job, channel, msg) abort
  call a:job.on_stdout(split(a:msg, "\n", 1))
endfunction

function! s:_err_cb(job, channel, msg) abort
  call a:job.on_stderr(split(a:msg, "\n", 1))
endfunction

function! s:_close_cb(job, channel) abort
  let a:job.__closed = v:true
  if has_key(a:job, 'on_stdout')
    let options = {'part': 'out'}
    while ch_status(a:channel, options) ==# 'buffered'
      call s:_out_cb(a:job, a:channel, ch_readraw(a:channel, options))
    endwhile
  endif
  if has_key(a:job, 'on_stderr')
    let options = {'part': 'err'}
    while ch_status(a:channel, options) ==# 'buffered'
      call s:_err_cb(a:job, a:channel, ch_readraw(a:channel, options))
    endwhile
  endif
endfunction

function! s:_exit_cb(job, channel, exitval) abort
  " Make sure on_stdout/on_stderr are called prior to on_exit.
  " This check requires 'close_cb' so perform only when on_stdout/on_stderr
  " is defined in a job instance.
  if has_key(a:job, 'on_stdout') || has_key(a:job, 'on_stderr')
    while !a:job.__closed
      sleep 1m
    endwhile
  endif
  call a:job.on_exit(a:exitval)
endfunction


" Instance -------------------------------------------------------------------
function! s:_job_id() abort dict
  return job_info(self.__job).process
endfunction

" NOTE:
" On Unix a non-existing command results in "dead" instead
" So returns "dead" instead of "fail" even in non Unix.
function! s:_job_status() abort dict
  let status = job_status(self.__job)
  return status ==# 'fail' ? 'dead' : status
endfunction

" NOTE:
" A Null character (\0) is used as a terminator of a string in Vim.
" Neovim can send \0 by using \n splitted list but in Vim.
" So replace all \n in \n splitted list to ''
function! s:_job_send(data) abort dict
  let data = type(a:data) == v:t_list
        \ ? join(map(a:data, 'substitute(v:val, "\n", '''', ''g'')'), "\n")
        \ : a:data
  return ch_sendraw(self.__job, data)
endfunction

function! s:_job_close() abort dict
  call ch_close_in(self.__job)
endfunction

function! s:_job_stop() abort dict
  call job_stop(self.__job)
  call timer_start(s:KILL_TIMEOUT_MS, { -> job_stop(self.__job, 'kill') })
endfunction

function! s:_job_wait(...) abort dict
  let timeout = a:0 ? a:1 : v:null
  let timeout = timeout is# v:null ? v:null : timeout / 1000.0
  let start_time = reltime()
  let job = self.__job
  try
    while timeout is# v:null || timeout > reltimefloat(reltime(start_time))
      let status = job_status(job)
      if status !=# 'run'
        return status ==# 'dead' ? job_info(job).exitval : -3
      endif
      sleep 1m
    endwhile
  catch /^Vim:Interrupt$/
    call self.stop()
    return -2
  endtry
  return -1
endfunction

" To make debug easier, use funcref instead.
let s:job = {
      \ 'id': function('s:_job_id'),
      \ 'status': function('s:_job_status'),
      \ 'send': function('s:_job_send'),
      \ 'close': function('s:_job_close'),
      \ 'stop': function('s:_job_stop'),
      \ 'wait': function('s:_job_wait'),
      \}
