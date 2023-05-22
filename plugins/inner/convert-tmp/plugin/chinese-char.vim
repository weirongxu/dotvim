" 全角数字、英文字符、英文标点。
" 65248 是相对应的全角和半角的 Unicode 偏差。
function s:FullWidthCn2En() range
  let store = winsaveview()
  exec printf('%s,%ss/\v[０-９Ａ-Ｚａ-ｚ]/\=nr2char(char2nr(submatch(0))-65248)/g', a:firstline, a:lastline)
  call winrestview()
endfunction

command! -range=% FullWidthCn2En <line1>,<line2>call <SID>FullWidthCn2En()
