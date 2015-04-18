if !exists('g:zv_zeal_directory')
  if has('win32') || has('win64')
    let g:zv_zeal_directory = $ProgramFiles."/Zeal/zeal.exe"
  else
    let g:zv_zeal_directory = "/usr/bin/zeal"
  endif
endif
" Set Zeal's execution command
if has('win32') || has('win64')
  let s:zealExecCmd = "!start \"".g:zv_zeal_directory."\""
else
  let s:zealExecCmd = "! ".g:zv_zeal_directory.""
endif
" A dictionary who contains the docset names of some file extensions
let s:zeavimDocsetNames = {
      \ 'c': 'C',
      \ 'cpp': 'C++',
      \ 'css': 'Css',
      \ 'html': 'Html',
      \ 'java': 'Java',
      \ 'js': 'Javascript',
      \ 'markdown': 'Markdown',
      \ 'md': 'Markdown',
      \ 'mdown': 'Markdown',
      \ 'mkd': 'Markdown',
      \ 'mkdn': 'Markdown',
      \ 'php': 'Php',
      \ 'py': 'Python',
      \ 'scss': 'Sass',
      \ 'sh': 'Bash',
      \ 'tex': 'Latex',
      \ }
" Add the external docset names from a global variable
if exists("g:zv_added_files_type")
  call extend(s:zeavimDocsetNames, g:zv_added_files_type, "error")
else
  let g:zv_added_files_type = {}
endif

function! zeal#execute(docsetName, selection)
  " Execute Zeal with the docset and selection passed in the arguments.

  if (a:docsetName != "")
    if has_key(s:zeavimDocsetNames, a:docsetName)
      let docsetName = s:zeavimDocsetNames[a:docsetName]
    else
      let docsetName = a:docsetName
    endif
    let s:executeZeal = "silent :".s:zealExecCmd." --query '".docsetName.":".a:selection."'"
  elseif (a:selection != "")
    let s:executeZeal = "silent :".s:zealExecCmd." --query '".a:selection."'"
  else
    let s:executeZeal = "silent :".s:zealExecCmd.""
  endif

  if has ('win32') || has('win64')
    execute s:executeZeal. " > NUL"
  else
    execute s:executeZeal." 2> /dev/null &"
  endif
  redraw!

endfunction
