" Save the current JavaScript indentexpr.
let b:jsx_js_indentexpr = &indentexpr
setlocal indentexpr=GetEmbedJavascriptIndent()

function! GetEmbedJavascriptIndent() "{{{
  if len(b:jsx_js_indentexpr)
    let ind = eval(b:jsx_js_indentexpr)
  else
    let ind = cindent(v:lnum)
  endif
  let scriptLine = searchpair('<script', '', '</script>', 'nW')
  if scriptLine
    let ind = ind + &sw + indent(scriptLine)
  endif

  return ind
endfunction "}}}
