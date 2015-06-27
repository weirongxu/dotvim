let g:trans_default_api = 'youdao'
let g:trans_has_python = 0
let g:trans_api.google = {
      \ 'url': 'http://translate.google.cn/translate_a/t',
      \ 'params' : {
      \   "client" : 'firefox-a',
      \   "ie" : 'UTF-8',
      \   "oe" : 'UTF-8',
      \ },
      \ 'query_str': 'langpair=%FROM%7C%TO&text=%TEXT',
      \ 'parser': 'trans#data#parser_google',
      \ 'type': 'get',
      \ 'headers': { 'User-Agent': 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.15 Safari/536.5' },
      \ }
