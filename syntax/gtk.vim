" Vim syntax file
" Language:     C gtk
" Maintainer:   krisna
" Last change:  2013-01-08

if version < 600
  so <sfile>:p:h/gtk/xlib.vim
  so <sfile>:p:h/gtk/glib.vim
  so <sfile>:p:h/gtk/pango.vim
  so <sfile>:p:h/gtk/gdk.vim
  so <sfile>:p:h/cpp.vim
else
  runtime! syntax/gtk/xlib.vim
  runtime! syntax/gtk/glib.vim
  runtime! syntax/gtk/pango.vim
  runtime! syntax/gtk/gdk.vim
  runtime! syntax/gtk/gtk.vim
  runtime! syntax/cpp.vim
endif
