" 执行run脚本,自动译编之类的
if has("unix")
  map <C-F7> :!chomd +x run.sh<CR>
  map <C-F8> :!./run.sh<CR>
else
  map <C-F8> :!run.bat<CR>
endif

command! -nargs=0 CompileCode call comp_run#CompileCode()
map <silent> <F5> :CompileCode<CR>

au FileType c,cpp,objc,objcpp,java call comp_run#CompileCodeAndLinkLib()

if has('unix')
  command! -nargs=0 ChmodCode call comp_run#ChmodCode()
  map <silent> <F7> :ChmodCode<CR>
endif

command! -nargs=0 RunCode call comp_run#RunCode()
map <silent> <F8> :RunCode<CR>
