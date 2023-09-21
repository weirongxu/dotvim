function! s:FixWhitespace(line1,line2)
  let store = winsaveview()
  %s/\v(\s|\r)+$//e
  call winrestview(store)
endfunction

" Run :FixWhitespace to remove end of line white space
command! -range=% FixWhitespace call <SID>FixWhitespace(<line1>,<line2>)
