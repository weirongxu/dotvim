let s:html_escape_dict = {
      \ '"': 'quot',
      \ "'": 'apos',
      \ '&': 'amp',
      \ '<': 'lt',
      \ '>': 'gt',
      \ ' ': 'nbsp',
      \ }
function! s:HtmlEscape()
  for k in keys(s:html_escape_dict)
    exec 'silent s/\V'.k.'/&'.s:html_escape_dict[k].';/eg'
  endfor
endfunction

function! s:HtmlUnEscape()
  for k in keys(s:html_escape_dict)
    exec 'silent s/\V&'.s:html_escape_dict[k].';/'.k.'/eg'
  endfor
endfunction

nmap <silent> <Leader>he <Cmd>call <SID>HtmlEscape()<CR>
nmap <silent> <Leader>hu <Cmd>call <SID>HtmlUnEscape()<CR>
vmap <silent> <Leader>he <Cmd>call <SID>HtmlEscape()<CR>
vmap <silent> <Leader>hu <Cmd>call <SID>HtmlUnEscape()<CR>
