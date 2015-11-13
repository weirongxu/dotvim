if ! exists('g:rand_password_chars')
  let g:rand_password_chars = "123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/?"
endif

function! RandPassword(length) "{{{
python <<EOF
import random
chars = list(vim.eval('g:rand_password_chars'))
length = int(vim.eval('a:length'))
ret = ''.join(random.choice(chars) for _ in range(length))
ret = ret.replace('\\', '\\\\')
ret = ret.replace('"', '\\"')
vim.command('let ret = "' + ret + '"')
EOF
  return ret
endfunction "}}}

function! RandPasswordInput() "{{{
  let length = input('Input rand password length:', '20')
  return RandPassword(length)
endfunction "}}}
