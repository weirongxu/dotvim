if ! exists('g:rand_password_chars')
  let g:rand_password_chars = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
endif

if ! exists('g:rand_password_words')
  let g:rand_password_words = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
endif

let s:V = vital#vimrc#new()
let s:Random = s:V.import('Random')
let s:XorRandom = s:Random.new('Xor128')

function! RandPassword(length) "{{{
  let ret = ''
  for i in range(1, str2nr(a:length))
    let ret .= s:XorRandom.sample(g:rand_password_chars)
  endfor
  return ret
endfunction "}}}

function! RandPasswordOnlyWord(length) "{{{
  let ret = ''
  for i in range(1, str2nr(a:length))
    let ret .= s:XorRandom.sample(g:rand_password_words)
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
