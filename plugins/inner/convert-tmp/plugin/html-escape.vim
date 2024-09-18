let s:html_escape_dict = {
      \ '"': 'quot',
      \ "'": 'apos',
      \ '&': 'amp',
      \ '<': 'lt',
      \ '>': 'gt',
      \ ' ': 'nbsp',
      \ }
function! s:HtmlEscape()
  for [k, v] in items(s:html_escape_dict)
    exec 'silent s/\V'.k.'/&'.v.';/eg'
  endfor
endfunction

function! s:HtmlUnEscape()
  for [k, v] in items(s:html_escape_dict)
    exec 'silent s/\V&'.v.';/'.k.'/eg'
  endfor
endfunction

nmap <silent> <Leader>he :call <SID>HtmlEscape()<CR>
nmap <silent> <Leader>hu :call <SID>HtmlUnEscape()<CR>
vmap <silent> <Leader>he :call <SID>HtmlEscape()<CR>
vmap <silent> <Leader>hu :call <SID>HtmlUnEscape()<CR>
