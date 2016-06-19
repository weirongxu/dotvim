let M = transformer#middle()
let S = transformer#source()

call transformer#cmd('Html2jade')
      \.src(S.smart())
      \.stream(
      \   M.pipe('html2jade - --donotencode --bodyless'),
      \   M.smart()
      \)

call transformer#cmd('Js2coffee')
      \.src(S.smart())
      \.stream(
      \   M.pipe('js2coffee'),
      \   M.smart()
      \)

call transformer#cmd('Coffee')
      \.src(S.smart())
      \.stream(
      \   M.pipe('coffee -scpb --no-header'),
      \   M.smart()
      \)

call transformer#cmd('Jade')
      \.src(S.smart())
      \.stream(
      \   M.pipe('jade -- pretty'),
      \   M.smart()
      \)

call transformer#cmd('Marked')
      \.src(S.smart())
      \.stream(
      \   M.pipe('marked'),
      \   M.smart()
      \)

call transformer#cmd('TStylus')
      \.src(S.smart())
      \.stream(
      \   M.pipe('stylus'),
      \   M.smart()
      \)

call transformer#cmd('Less')
      \.src(S.smart())
      \.stream(
      \   M.pipe('lessc -'),
      \   M.smart()
      \)

call transformer#cmd('Scss')
      \.src(S.smart())
      \.stream(
      \   M.pipe('sass -s'),
      \   M.smart()
      \)


" let u_buffer = transformer#unite('buffer')
"       \ .stream(
"       \   M.exec('Unite buffer')
"       \ )
" let u_bookmarking = transformer#unite('bookmark')
"       \.stream(
"       \   M.exec('Unite bookmark')
"       \)
" let u_resume = transformer#unite('bookmark')
"       \.stream(
"       \   M.exec('UniteResume')
"       \)
" let unite = transformer#cmd('U')
"       \.stream(
"       \   M.unite([u_buffer, u_bookmarking, u_resume])
"       \ )
