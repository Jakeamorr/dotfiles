" -----------------------------------------------------------------------------
" File: gruvbox.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/gruvbox
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name='gruv'

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]        " 29-32-33
let s:gb.dark0       = ['#282828', 235]        " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]        " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]        " 60-56-54
let s:gb.dark2       = ['#504945', 239]        " 80-73-69
let s:gb.dark3       = ['#665c54', 241]        " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]        " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]        " 124-111-100
let s:gb.gray_245    = ['#928374', 245]        " 146-131-116
let s:gb.gray_244    = ['#928374', 244]        " 146-131-116
let s:gb.light0_hard = ['#f9f5d7', 230]        " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229]        " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]        " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223]        " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]        " 213-196-161
let s:gb.light3      = ['#bdae93', 248]        " 189-174-147
let s:gb.light4      = ['#a89984', 246]        " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]        " 168-153-132
let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25
let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14
let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" Setup Colors: 
let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" Determine Relative Colors: 
let s:bg0  = s:gb.dark0_soft
let s:bg1  = s:gb.dark1
let s:bg2  = s:gb.dark2
let s:bg3  = s:gb.dark3
let s:bg4  = s:gb.dark4
let s:gray = s:gb.gray_245
let s:fg0 = s:gb.light0
let s:fg1 = s:gb.light1
let s:fg2 = s:gb.light2
let s:fg3 = s:gb.light3
let s:fg4 = s:gb.light4
let s:fg4_256 = s:gb.light4_256
let s:red    = s:gb.bright_red
let s:green  = s:gb.bright_green
let s:yellow = s:gb.bright_yellow
let s:blue   = s:gb.bright_blue
let s:purple = s:gb.bright_purple
let s:aqua   = s:gb.bright_aqua
let s:orange = s:gb.bright_orange

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4
let s:gb.gray = s:gray
let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4
let s:gb.fg4_256 = s:fg4_256
let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" Highlighting Function: 
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:gruvbox_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:gruvbox_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" memoize common hi groups
call s:HL('GruvboxFg0', s:fg0)
call s:HL('GruvboxFg1', s:fg1)
call s:HL('GruvboxFg2', s:fg2)
call s:HL('GruvboxFg3', s:fg3)
call s:HL('GruvboxFg4', s:fg4)
call s:HL('GruvboxGray', s:gray)
call s:HL('GruvboxBg0', s:bg0)
call s:HL('GruvboxBg1', s:bg1)
call s:HL('GruvboxBg2', s:bg2)
call s:HL('GruvboxBg3', s:bg3)
call s:HL('GruvboxBg4', s:bg4)
call s:HL('GruvboxRed', s:red)
call s:HL('GruvboxGreen', s:green)
call s:HL('GruvboxYellow', s:yellow)
call s:HL('GruvboxBlue', s:blue)
call s:HL('GruvboxPurple', s:purple)
call s:HL('GruvboxAqua', s:aqua)
call s:HL('GruvboxOrange', s:orange)
call s:HL('Normal', s:fg1, s:bg0)
call s:HL('MatchParen', s:none, s:bg3)

" Line number for :number and :# commands
call s:HL('LineNr', s:fg4)
" Color column
hi ColorColumn ctermbg=5

" Generic statement
hi! link Statement GruvboxPurple
" if, then, else, endif, swicth, etc.
hi! link Conditional GruvboxPurple
" for, do, while, etc.
hi! link Repeat GruvboxPurple
" case, default, etc.
hi! link Label GruvboxPurple
" try, catch, throw
hi! link Exception GruvboxPurple
" sizeof, "+", "*", etc.
hi! link Operator GruvboxPurple
" Any other keyword
hi! link Keyword GruvboxPurple

" Variable name
hi! link Identifier GruvboxBlue
" Function name
hi! link Function GruvboxPurple

" Generic preprocessor
hi! link PreProc GruvboxAqua
" Preprocessor #include
hi! link Include GruvboxAqua
" Preprocessor #define
hi! link Define GruvboxAqua
" Same as Define
hi! link Macro GruvboxAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit GruvboxAqua

" Generic constant
hi! link Constant GruvboxPurple
" Character constant: 'c', '/n'
hi! link Character GruvboxPurple
" String constant: 
call s:HL('String',  s:fg1, s:bg1) 
" Boolean constant: TRUE, false
hi! link Boolean GruvboxPurple
" Number constant: 234, 0xff
hi! link Number GruvboxPurple
" Floating point constant: 2.3e10
hi! link Float GruvboxPurple

" Generic type
hi! link Type Normal
" static, register, volatile, etc
hi! link StorageClass GruvboxOrange
" struct, union, enum, etc.
hi! link Structure GruvboxAqua
" typedef
hi! link Typedef GruvboxYellow

" Comment
hi! link Comment GruvboxGreen

" Netrw: 
hi! link netrwDir GruvboxAqua
hi! link netrwClassify GruvboxAqua
hi! link netrwLink GruvboxGray
hi! link netrwSymLink GruvboxFg1
hi! link netrwExe GruvboxYellow
hi! link netrwComment GruvboxGray
hi! link netrwList GruvboxBlue
hi! link netrwHelpCmd GruvboxAqua
hi! link netrwCmdSep GruvboxFg3
hi! link netrwVersion GruvboxGreen
hi! link netrwMarkFile GruvboxOrange

" Html: 
hi! link htmlTag GruvboxBlue
hi! link htmlEndTag GruvboxBlue
hi! link htmlTagName GruvboxAquaBold
hi! link htmlArg GruvboxAqua
hi! link htmlScriptTag GruvboxPurple
hi! link htmlTagN GruvboxFg1
hi! link htmlSpecialTagName GruvboxAquaBold
call s:HL('htmlLink', s:fg4, s:none)
hi! link htmlSpecialChar GruvboxOrange

" CSS: 
hi! link cssBraces GruvboxPurple
hi! link cssFunctionName GruvboxAqua
hi! link cssIdentifier Normal
hi! link cssClassName Normal
hi! link cssColor Normal
hi! link cssSelectorOp Normal
hi! link cssSelectorOp2 Normal
hi! link cssImportant GruvboxRed
hi! link cssVendor GruvboxAqua
hi! link cssTextProp Normal
hi! link cssAnimationProp Normal
hi! link cssUIProp Normal
hi! link cssTransformProp Normal
hi! link cssTransitionProp Normal
hi! link cssPrintProp Normal
hi! link cssPositioningProp Normal
hi! link cssBoxProp Normal
hi! link cssFontDescriptorProp Normal
hi! link cssFlexibleBoxProp Normal
hi! link cssBorderOutlineProp Normal
hi! link cssBackgroundProp Normal
hi! link cssMarginProp Normal
hi! link cssListProp Normal
hi! link cssTableProp Normal
hi! link cssFontProp Normal
hi! link cssPaddingProp Normal
hi! link cssDimensionProp Normal
hi! link cssRenderProp Normal
hi! link cssColorProp Normal
hi! link cssMediaProp Normal
hi! link cssFlexibleBoxAttr Normal
hi! link cssValueLength Normal
hi! link cssUnitDecorators Normal

" JavaScript: 
hi! link javaScriptBraces GruvboxPurple
hi! link javaScriptFunction GruvboxPurple
hi! link javaScriptIdentifier GruvboxAqua
hi! link javaScriptMember GruvboxAqua
hi! link javaScriptNumber Normal
hi! link javaScriptNull GruvboxPurple
hi! link javaScriptParens GruvboxPurple

" TODO: Still need to take a look at these...
hi! link javascriptDefault GruvboxAqua

hi! link javascriptEndColons GruvboxFg1
hi! link javascriptFuncArg GruvboxFg1
hi! link javascriptGlobalMethod GruvboxFg1
hi! link javascriptNodeGlobal GruvboxFg1
hi! link javascriptBOMWindowProp GruvboxFg1
hi! link javascriptArrayMethod GruvboxFg1
hi! link javascriptArrayStaticMethod GruvboxFg1
hi! link javascriptCacheMethod GruvboxFg1
hi! link javascriptDateMethod GruvboxFg1
hi! link javascriptMathStaticMethod GruvboxFg1

hi! link javascriptURLUtilsProp GruvboxFg1
hi! link javascriptBOMNavigatorProp GruvboxFg1
hi! link javascriptDOMDocMethod GruvboxFg1
hi! link javascriptDOMDocProp GruvboxFg1
hi! link javascriptBOMLocationMethod GruvboxFg1
hi! link javascriptBOMWindowMethod GruvboxFg1
hi! link javascriptStringMethod GruvboxFg1

hi! link javascriptVariable GruvboxOrange
hi! link javascriptIdentifier GruvboxOrange
hi! link javascriptClassSuper GruvboxOrange

hi! link javascriptFuncKeyword GruvboxAqua
hi! link javascriptAsyncFunc GruvboxAqua
hi! link javascriptClassStatic GruvboxOrange

hi! link javascriptOperator GruvboxRed
hi! link javascriptForOperator GruvboxRed
hi! link javascriptYield GruvboxRed
hi! link javascriptExceptions GruvboxRed
hi! link javascriptMessage GruvboxRed

hi! link javascriptTemplateSB GruvboxAqua
hi! link javascriptTemplateSubstitution GruvboxFg1

hi! link javascriptLabel GruvboxFg1
hi! link javascriptObjectLabel GruvboxFg1
hi! link javascriptPropertyName GruvboxFg1

hi! link javascriptLogicSymbols GruvboxFg1
hi! link javascriptArrowFunc GruvboxYellow

hi! link javascriptDocParamName GruvboxFg4
hi! link javascriptDocTags GruvboxFg4
hi! link javascriptDocNotation GruvboxFg4
hi! link javascriptDocParamType GruvboxFg4
hi! link javascriptDocNamedParamType GruvboxFg4

hi! link javascriptBrackets GruvboxFg1
hi! link javascriptDOMElemAttrs GruvboxFg1
hi! link javascriptDOMEventMethod GruvboxFg1
hi! link javascriptDOMNodeMethod GruvboxFg1
hi! link javascriptDOMStorageMethod GruvboxFg1
hi! link javascriptHeadersMethod GruvboxFg1

hi! link javascriptAsyncFuncKeyword GruvboxRed
hi! link javascriptAwaitFuncKeyword GruvboxRed
