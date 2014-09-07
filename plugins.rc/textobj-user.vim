call textobj#user#plugin('php', {
\   'code': {
\     'pattern': ['<?php\>', '?>'],
\     'select-a': 'aP',
\     'select-i': 'iP',
\   },
\ })
call textobj#user#plugin('webscript', {
\   'code': {
\     'pattern': ['<?', '?>'],
\     'select-a': 'a?',
\     'select-i': 'i?',
\   },
\ })
