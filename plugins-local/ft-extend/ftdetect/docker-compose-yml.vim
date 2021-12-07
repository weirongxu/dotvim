function SetFiletypeToDockerCompose(...)
  setf yaml.docker-compose
endfunction

autocmd BufNewFile,BufRead docker-compose.yml call timer_start(500, 'SetFiletypeToDockerCompose')
