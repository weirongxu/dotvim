let s:save_cpo = &cpo
set cpo&vim

function! s:npmhome() "{{{
  let line = getline('.')
  let pos = getcurpos()[2]

  for i in range(pos, 0, -1)
    if line[i] == '"' || line[i] =="'"
      let pos_left = i + 1
      break
    endif
  endfor

  for i in range(pos, strlen(line)-1, 1)
    if line[i] == '"' || line[i] =="'"
      let pos_right = i - 1
      break
    endif
  endfor

  if exists('pos_left') && exists('pos_right')
    let name = strpart(line, pos_left, pos_right-pos_left+1)
    let v = vital#of('vital')
    let process = v.import('Process')
    let uri = process.system('npm info ' . name . ' homepage')
    call openbrowser#open(split(uri, '\r\|\n')[1])
    " call openbrowser#open('https://www.npmjs.com/package/' . name)
  else
    echo 'not found package name'
  endif
endfunction "}}}
command! Npmhome call <SID>npmhome()

let &cpo = s:save_cpo
unlet s:save_cpo
" vim: fdm=marker
