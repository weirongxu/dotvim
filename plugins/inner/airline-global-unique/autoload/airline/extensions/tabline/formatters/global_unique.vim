function! airline#extensions#tabline#formatters#global_unique#format(bufnr, buffers)
  return AirlineGlobalUnique(a:bufnr, a:buffers)
endfunction
