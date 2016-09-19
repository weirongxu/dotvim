if ! exists('g:rand_password_chars')
  let g:rand_password_chars = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
endif

if ! exists('g:rand_password_words')
  let g:rand_password_words = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
endif

function! s:random() "{{{
  if ! exists('*vital#of')
    finish
  endif
  if ! exists('s:R')
    let s:V = vital#of('vital')
    let s:Random = s:V.import('Random')
    let s:R = s:Random.new('Xor128')
  endif
  return s:R
endfunction "}}}


function! RandPassword(length) "{{{
  let ret = ''
  for i in range(1, str2nr(a:length))
    let ret .= s:random().sample(g:rand_password_chars)
  endfor
  return ret
endfunction "}}}

function! RandPasswordOnlyWord(length) "{{{
  let ret = ''
  for i in range(1, str2nr(a:length))
    let ret .= s:random().sample(g:rand_password_words)
  endfor
  return ret
endfunction "}}}

function! RandPasswordInputOnlyWord() "{{{
  let length = input('Input rand words password length:', '20')
  return RandPasswordOnlyWord(length)
endfunction "}}}

function! RandPasswordInput() "{{{
  let length = input('Input rand password length:', '20')
  return RandPassword(length)
endfunction "}}}
