function! s:init()
  hi HighlightText ctermbg=242 guibg=#404040
  hi ErrorHighlight guibg=#802020
  hi WarningHighlight guibg=#806022
  hi InfoHighlight guibg=#806022
  hi HintHighlight guibg=#224290
endfunction

autocmd ColorScheme * call s:init()
