if ! exists('g:rand_password_chars')
  let g:rand_password_chars = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
endif

let s:V = vital#of('vital')
let s:Random = s:V.import('Random')
let s:R = s:Random.new('Xor128')

function! RandPassword(length) "{{{
  let ret = ''
  for i in range(1, str2nr(a:length))
    let ret .= s:R.sample(g:rand_password_chars)
  endfor
  return ret
endfunction "}}}

function! RandPasswordInput() "{{{
  let length = input('Input rand password length:', '20')
  return RandPassword(length)
endfunction "}}}
