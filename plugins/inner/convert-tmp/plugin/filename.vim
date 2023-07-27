let s:dict = {
      \ '[': '(',
      \ ']': ')',
      \ '（': '(',
      \ '）': ')',
      \ '【': '(',
      \ '】': ')',
      \ '\s\?:\s\?': '：',
      \ '\s\{2,}': ' ',
      \ '\s\*.': '.',
      \ }

function s:filename_convert() range
  let store = winsaveview()
  for [k, v] in items(s:dict)
    exec printf('%s,%ss/\V'.k.'/'.v.'/eg', a:firstline, a:lastline)
  endfor
  call winrestview(store)
endfunction

command! -range=% FilenameConvert <line1>,<line2>call <SID>filename_convert()
