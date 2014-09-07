let M = transformer#middle()
let S = transformer#source()

call transformer#cmd('Html2jade')
      \.src(S.smart())
      \.exec(
      \   M.pipe('html2jade - --donotencode --bodyless'),
      \   M.smart()
      \)

call transformer#cmd('Js2coffee')
      \.src(S.smart())
      \.exec(
      \   M.pipe('js2coffee'),
      \   M.smart()
      \)

call transformer#cmd('Coffee')
      \.src(S.smart())
      \.exec(
      \   M.pipe('coffee -scpb --no-header'),
      \   M.smart()
      \)

call transformer#cmd('Jade')
      \.src(S.smart())
      \.exec(
      \   M.pipe('jade -- pretty'),
      \   M.smart()
      \)

call transformer#cmd('Marked')
      \.src(S.smart())
      \.exec(
      \   M.pipe('marked'),
      \   M.smart()
      \)

call transformer#cmd('Stylus')
      \.src(S.smart())
      \.exec(
      \   M.pipe('stylus'),
      \   M.smart()
      \)

call transformer#cmd('Less')
      \.src(S.smart())
      \.exec(
      \   M.pipe('lessc -'),
      \   M.smart()
      \)

call transformer#cmd('Scss')
      \.src(S.smart())
      \.exec(
      \   M.pipe('sass -s'),
      \   M.smart()
      \)
