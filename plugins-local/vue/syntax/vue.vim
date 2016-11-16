if exists("b:current_syntax")
  finish
endif

runtime! syntax/html.vim
runtime! syntax/html/*.vim
runtime! after/syntax/html.vim
runtime! after/syntax/html/*.vim

let b:current_syntax = 'vue'
