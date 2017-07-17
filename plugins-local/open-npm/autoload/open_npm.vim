function! open_npm#open() "{{{
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
    let uri = split(uri, '\r\|\n')
    let uri = uri[-1]
    echo uri
    call openbrowser#open(uri)
    " call openbrowser#open('https://www.npmjs.com/package/' . name)
  else
    echo 'not found package name'
  endif
endfunction "}}}
