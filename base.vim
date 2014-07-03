"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 载入设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 显示配制
execute "source ".$MYVIMFILES."/display.vim"

" 键盘映射
execute "source ".$MYVIMFILES."/mapkey.vim"

" 脚本设置
let $MYPlugin = $MYVIMFILES."/plugin.vim"
execute "source ".$MYPlugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 语法高亮
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufRead,BufNewFile *.js set syntax=jquery
au BufRead,BufNewFile *.css set syntax=css3
" au BufRead,BufNewFile *.c,*.cpp set syntax=gtk
au FileType c,cpp set syntax=gtk

syntax on
syntax enable
" 检测文件类型并开启相关插件
filetype on
filetype plugin on
filetype plugin indent on
