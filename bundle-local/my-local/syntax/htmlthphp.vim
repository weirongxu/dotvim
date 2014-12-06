" Thinkphp's templete syntax file
" Maintainer: WeiRong Xu <weirongxuraidou@gmail.com>
" Last Change: 2013-12-21
" Version: 0.01

runtime! syntax/php.vim
runtime! syntax/php/*.vim
runtime! after/syntax/php.vim
runtime! after/syntax/php/*.vim

runtime! syntax/html.vim
runtime! syntax/html/*.vim
runtime! after/syntax/html.vim
runtime! after/syntax/html/*.vim

syn region thphpFn matchgroup=Delimiter start="{:" end="}" contains=@phpClTop
syn region thphpEcho matchgroup=Delimiter start="{:" end="}" contains=@phpClTop
