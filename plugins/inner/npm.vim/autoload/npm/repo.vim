function! npm#repo#open() "{{{
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
    call process.system('npm repo ' . name)
  else
    echo 'not found package name'
  endif
endfunction "}}}
