if exists("b:did_indent")
  finish
endif

runtime! indent/html.vim

let b:did_indent = 1
