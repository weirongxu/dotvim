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
