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
let s:zealDocsetNames = {
      \ 'cpp': 'c++',
      \ 'html': 'html',
      \ 'java': 'java se8',
      \ 'js': 'javascript',
      \ 'markdown': 'markdown',
      \ 'md': 'markdown',
      \ 'mdown': 'markdown',
      \ 'mkd': 'markdown',
      \ 'mkdn': 'markdown',
      \ 'py': 'python',
      \ 'scss': 'Sass',
      \ 'sh': 'bash',
      \ 'tex': 'latex',
      \ }
" Add the external docset names from a global variable
if exists("g:zv_added_files_type")
  call extend(s:zealDocsetNames, g:zv_added_files_type, "error")
else
  let g:zv_added_files_type = {}
endif

function! zeal#execute(docsetName, selection)
  " Execute Zeal with the docset and selection passed in the arguments.

  if (a:docsetName != "")
    if has_key(s:zealDocsetNames, a:docsetName)
      let docsetName = s:zealDocsetNames[a:docsetName]
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
