" Author: cold
"  Email: wh_linux@126.com
"   Date: 2012/12/20 16:23
"   Desc: 英汉/汉英翻译插件
" Useage: 
"     <Leader> t 1.翻译当前光标下内容
"                2.或翻译选中的内容
"     <Leader> lt 翻译当前行
" TODO: 新建buf窗口打开

function! s:get_visual_selection()
  let reg = '"'
  let reg_save = getreg(reg)
  let reg_type = getregtype(reg)
  silent exe 'norm! gv"'.reg.'y'
  let cont = getreg(reg)
  call setreg(reg,reg_save,reg_type)
  return cont
endfunction

function s:Translate(m)
  " m 1 -> 翻译当前行
  " m 2 -> 翻译选中
  if a:m == 0
    let word = expand('<cword>') " 如果是命令模式则取当前字符下单词
  elseif a:m == 2
    " let word = getreg('*')     " 如果是选择模式获取选择块
    let word = s:get_visual_selection()
  elseif a:m == 1
    let word = getline('.')
  endif
python << EOF

import vim
import sys
import urllib
import urllib2

class Translate(object):
  """ 使用google进行英->汉, 汉->英的翻译 """
  def __init__(self, text, src='zh-CN', dst = 'en'):
    self.url = 'http://translate.google.cn/translate_a/t'
    self.params = dict(client = "t", text=text,
        hl = 'zh-CN', tl = dst,
        multires = '1', prev = 'btn',
        ssel = '0', sc = '1')
    if src != self.params.get('hl'):
      self.params.update(sl = src)

    return

  def loads(self, content):
    """ 加载翻译结果 """
    while ',,' in content or '[,' in content:
      content = content.replace(',,', ',"",')
      content = content.replace('[,', '["",')
      content = content.replace(',]', '"",]')
      content = content.replace('true', 'True')
      content = content.replace('false', 'False')

    content = eval(content)
    source = ''
    tran = ''
    pinyin = ''
    results = content[0]
    for result in results:
      source += result[0]
      tran += result[1]
      pinyin += result[2] if result[2] else result[3]
    desc = content[1]
    others = ''
    for d in desc:
      others += d[0] + '\n'
      for i in d[1]:
        others += "  {0}  ".format(i)
        for s in d[2]:
          if s[0] == i:
            others +=','.join(s[1]) + '\n'
    return dict(
      result = source,
      source = tran,
      pinyin = pinyin,
      others = others
    )

  def translate(self):
    """ 调用google翻译 """
    params = urllib.urlencode(self.params)
    req = urllib2.Request(self.url, params)
    req.add_header("User-Agent",
        "Mozilla/5.0+(compatible;+Googlebot/2.1;"
        "++http://www.google.com/bot.html)")

    res = urllib2.urlopen(req)
    result =  res.read()
    return self.loads(result)

def auto_translate(text):
  """ 自动检测当前语言进行翻译 """
  text = text.decode('utf-8', 'ignore')
  if text[0] > u'z':
    src = 'zh-CN'
    dst = 'en'
  else:
    src = 'en'
    dst = 'zh-CN'

  t = Translate(text.encode('utf-8'), src, dst)
  result = t.translate()
  return result

def _T(string):
  """转换编码"""
  return string.decode('utf-8').encode(vim.eval('&encoding'))

word = vim.eval('word')
# word = "system. It is also an authoring and publishing system. "
# word = "上"
result = auto_translate(word.strip())

print(_T('源词: ' + result.get("source")))
print(_T('结果: ' + result.get("result")))
print(_T('拼音: ' + result.get("pinyin")))
if result.get('others'):
  print(_T('是否显示其他释义: (y/n):'))
  vim.command('let sel = getchar()')
  if vim.eval('sel') == str(ord('y')):
    print(_T(result.get('others')))
  else:
    vim.command('call feedkeys("\<ESC>")')

EOF

endfunc
nmap <Leader>tr :call <SID>Translate(0)<cr>
nmap <Leader>lt :call <SID>Translate(1)<cr>
vmap <Leader>tr :<C-u>call <SID>Translate(2)<cr>
