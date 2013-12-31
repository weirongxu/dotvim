function! comp_run#is_windows() "{{{
  return has("win32") || has("win64") || has("win95") || has("win16")
endfunction "}}}

function! comp_run#system_open_link(url) "{{{
  " handlers
  function! s:win32_handler(url)
    execute 'silent ! start "Title" /B ' . shellescape(a:url, 1)
  endfunction
  function! s:macunix_handler(url)
    execute '!open ' . shellescape(a:url, 1)
  endfunction
  function! s:linux_handler(url)
    call system('xdg-open ' . shellescape(a:url, 1).' &')
  endfunction
  let success = 0
  try 
    if comp_run#is_windows()
      call s:win32_handler(a:url)
      return
    elseif has("macunix")
      call s:macunix_handler(a:url)
      return
    else
      call s:linux_handler(a:url)
      return
    endif
  endtry
  echomsg 'Default Vimwiki link handler was unable to open the HTML file!'
endfunction "}}}

function! comp_run#CompileCode()
  silent exec "w"
  if &filetype == "c"
    if has("win32")
      " exec '!gcc -std=c99 -Wall -g -finput-charset=UTF-8 -fexec-charset=GBK % -o %<.exe'
      exec '!gcc -Wall -g % -o %<.exe'
    else
      " exec '!gcc -std=c99 -Wall -g % -o %<'
      exec '!gcc -Wall -g % -o %<'
    endif
  elseif &filetype == "cpp"
    if has("win32")
      " exec '!g++ -std=c++98 -Wall -g -finput-charset=UTF-8 -fexec-charset=GBK % -o %<.exe'
      exec '!g++ -Wall -g % -o %<.exe'
    else
      " exec '!g++ -std=c++98 -Wall -g % -o %<'
      exec '!g++ -Wall -g % -o %<'
    endif
  elseif &filetype == "java"
    exec '!javac -g %'
  elseif &filetype == "haskell"
    exec "!ghc --make % -o %<"
  elseif &filetype == "lua"
    exec "!lua %"
  elseif &filetype == "perl"
    exec "!perl %"
  elseif &filetype == "python"
    exec "!python %"
  elseif &filetype == "ruby"
    exec "!ruby %"
  endif
endfunction

func! comp_run#CompileCodeAndLinkLib() "{{{
  if &filetype == 'java'
    " F6 加载当前包并编译
    map <buffer> <F6> :!javac -g -d . %<CR>
    " F8 运行java程序
    map <buffer> <F8> :!java %<<CR>
    " F8 加载当前路径的包并运行java程序
    map <buffer> <C-F8> :!java -classpath . %<CR>
  else
    if has("win32")
      " windows.h 编程
      map <buffer> <C-F5> :!g++ -Wall -g -mwindows -finput-charset=UTF-8 -fexec-charset=GBK % -o %<.exe<CR>
      " F6 编译C 并连接gtk
      map <buffer> <F6> :!quickgtk %<CR>
      " C-F6  编译C++ 并连接gtk
      map <buffer> <C-F6> :!quickgtk -+ %<CR>
    else
      " F6  编译并连接gtk
      map <buffer> <F6> :!g++ -Wall -g % -o %< `pkg-config --cflags --libs gtk+-2.0`<CR>
      " F7 编译C 并连接mysql
      map <buffer> <F7> :!g++ -Wall -g % -o %< `mysql_config --cflags --libs`<CR>
    endif
  endif
endfunc "}}}

func! comp_run#ChmodCode() "{{{
  !chmod +x %
endfunc "}}}

"运行可执行文件
func! comp_run#RunCode() "{{{
  silent exec 'w'
  if &filetype == 'c' || &filetype == 'cpp' || &filetype == 'haskell'
    if has('unix')
      exec '!./%<'
    else
      exec '!%<.exe'
    endif
  elseif &filetype == 'java'
    exec '!java %<'
  elseif &filetype == 'lua'
    exec '!lua %'
  elseif &filetype == 'perl'
    exec '!perl %'
  elseif &filetype == 'python'
    exec '!python %'
  elseif &filetype == 'ruby'
    exec '!ruby %'
  elseif &filetype == 'vim'
    exec 'source %'
  elseif &filetype == 'javascript'
    exec 'node %'
  elseif has('unix')
    if &filetype == 'sh'
      exec '!./%'
    elseif &filetype == 'html' || &filetype == 'xhtml'
      exec '!google-chrome "%"&'
    endif
  elseif has('win32')
    if &filetype == 'dosbatch'
      exec '!%'
    elseif &filetype == 'html' || &filetype == 'xhtml'
      call comp_run#system_open_link(expand('%:p'))
    endif
  endif
endfunc "}}}
