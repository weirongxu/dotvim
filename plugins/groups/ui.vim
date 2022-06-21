PluginAdd 'ryanoasis/vim-devicons'

PluginAdd 'lambdalisue/nerdfont.vim'

PluginAdd 'lambdalisue/glyph-palette.vim'
function! g:plugin_hooks[SourcedHook()]()
  augroup my-glyph-palette
    autocmd! *
    autocmd FileType fern,nerdtree,startify call glyph_palette#apply()
  augroup END
endfunction

if g:env#nvim
  PluginAdd 'kyazdani42/nvim-web-devicons'
  function! g:plugin_hooks[SourcedHook()]()
    lua<<EOF
    local devicons = require('nvim-web-devicons')
    local override = {
      ["spec.js"] = {
        icon = "",
        color = "#ffc600",
        name = "TsTest",
      },
      ["spec.ts"] = {
        icon = "",
        color = "#ffc600",
        name = "TsTest",
      },
    }
    devicons.setup {
      override = override,
      default = true,
    }
EOF
  endfunction
endif

PluginAdd 'liuchengxu/eleline.vim'
PluginAdd 'nvim-lua/lsp-status.nvim'


PluginAdd 'Yggdroot/indentLine'
let g:indentLine_fileTypeExclude = [
      \  '',
      \  'defx',
      \  'coc-explorer',
      \  'json',
      \  'vimfiler',
      \  'unite',
      \  'tagbar',
      \  'gina-status',
      \  'gina-grep',
      \  'gina-branch',
      \  'gina-log',
      \]
let g:indentLine_concealcursor = ''
let g:indentLine_conceallevel = 1
let g:indentLine_faster = 1
if !g:env#x
  let g:indentLine_color_term = 8
endif

if g:env#gui
  PluginAdd 'drmikehenry/vim-fontsize', {'on_map': '<Plug>Fontsize'}
  nmap <silent> <C-ScrollWheelUp>   <Plug>FontsizeInc
  nmap <silent> <C-ScrollWheelDown> <Plug>FontsizeDec
  function! g:plugin_hooks[SourceHook()]()
    call AddCommand('fontsize.FontsizeBegin', '<Plug>FontsizeBegin')
    call AddCommand('fontsize.FontsizeInc', '<Plug>FontsizeInc')
    call AddCommand('fontsize.FontsizeDec', '<Plug>FontsizeDec')
    call AddCommand('fontsize.FontsizeDefault', '<Plug>FontsizeDefault')
  endfunction
endif

if !g:env#gui
  PluginAdd 'jszakmeister/vim-togglecursor'
endif

if g:env#nvim
  PluginAdd 'equalsraf/neovim-gui-shim'
endif

PluginAdd 'simeji/winresizer'
let g:winresizer_start_key = '<C-w><Space>'
