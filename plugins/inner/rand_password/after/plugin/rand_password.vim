if ! exists('g:rand_password_chars')
  let g:rand_password_chars = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
endif

if ! exists('g:rand_password_words')
  let g:rand_password_words = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
endif

let s:V = vital#vimrc#new()
let s:Random = s:V.import('Random')
let s:XorRandom = s:Random.new('Xor128')

function! RandSeq(str, length) "{{{
  return join(s:XorRandom.sample(split(a:str, '\zs'), a:length), '')
endfunction "}}}

function! RandPasswordInput() "{{{
  let length = input('Input rand password length:', '20')
  return RandSeq(g:rand_password_chars, length)
endfunction "}}}

function! RandPasswordInputOnlyWord() "{{{
  let length = input('Input rand words password length:', '20')
  return RandSeq(g:rand_password_words, length)
endfunction "}}}
