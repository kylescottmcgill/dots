hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "numix"
if &background == "light"
    hi Boolean gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#f7f7f7 cterm=NONE ctermfg=NONE ctermbg=#f7f7f7
    hi Comment gui=NONE guifg=#a1a1a1 guibg=NONE cterm=NONE ctermfg=#a1a1a1 ctermbg=NONE
    hi Conceal gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Conditional gui=NONE guifg=#6889bb guibg=NONE cterm=NONE ctermfg=#6889bb ctermbg=NONE
    hi Constant gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE cterm=reverse ctermfg=NONE ctermbg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#f7f7f7 cterm=NONE ctermfg=NONE ctermbg=#f7f7f7
    hi CursorLine gui=NONE guifg=NONE guibg=#f7f7f7 cterm=NONE ctermfg=NONE ctermbg=#f7f7f7
    hi CursorLineNr gui=NONE guifg=#a1a1a1 guibg=NONE cterm=NONE ctermfg=#a1a1a1 ctermbg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#f0fff0 cterm=NONE ctermfg=NONE ctermbg=#f0fff0
    hi DiffChange gui=NONE guifg=NONE guibg=#f7f7f7 cterm=NONE ctermfg=NONE ctermbg=#f7f7f7
    hi DiffDelete gui=NONE guifg=NONE guibg=#fff0f0 cterm=NONE ctermfg=NONE ctermbg=#fff0f0
    hi DiffText gui=NONE guifg=NONE guibg=#e8e8e8 cterm=NONE ctermfg=NONE ctermbg=#e8e8e8
    hi Directory gui=NONE guifg=#4f4f4f guibg=NONE cterm=NONE ctermfg=#4f4f4f ctermbg=NONE
    hi Error gui=NONE guifg=NONE guibg=#fff0f0 cterm=NONE ctermfg=NONE ctermbg=#fff0f0
    hi ErrorMsg gui=NONE guifg=NONE guibg=#fff0f0 cterm=NONE ctermfg=NONE ctermbg=#fff0f0
    hi FoldColumn gui=NONE guifg=#c7c7c7 guibg=NONE cterm=NONE ctermfg=#c7c7c7 ctermbg=NONE
    hi Folded gui=NONE guifg=#a1a1a1 guibg=NONE cterm=NONE ctermfg=#a1a1a1 ctermbg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#e8e8e8 cterm=NONE ctermfg=NONE ctermbg=#e8e8e8
    hi LineNr gui=NONE guifg=#c7c7c7 guibg=NONE cterm=NONE ctermfg=#c7c7c7 ctermbg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#e8e8e8 cterm=NONE ctermfg=NONE ctermbg=#e8e8e8
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi NonText gui=NONE guifg=#c7c7c7 guibg=NONE cterm=NONE ctermfg=#c7c7c7 ctermbg=NONE
    hi Normal gui=NONE guifg=#000000 guibg=#ffffff cterm=NONE ctermfg=#000000 ctermbg=#ffffff
    hi Number gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#f7f7f7 cterm=NONE ctermfg=NONE ctermbg=#f7f7f7
    hi PmenuSbar gui=NONE guifg=NONE guibg=#f0f0f0 cterm=NONE ctermfg=NONE ctermbg=#f0f0f0
    hi PmenuSel gui=NONE guifg=NONE guibg=#e8e8e8 cterm=NONE ctermfg=NONE ctermbg=#e8e8e8
    hi PmenuThumb gui=NONE guifg=NONE guibg=#e0e0e0 cterm=NONE ctermfg=NONE ctermbg=#e0e0e0
    hi Question gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi Search gui=NONE guifg=NONE guibg=#f0f0f0 cterm=NONE ctermfg=NONE ctermbg=#f0f0f0
    hi SignColumn gui=NONE guifg=#c7c7c7 guibg=NONE cterm=NONE ctermfg=#c7c7c7 ctermbg=NONE
    hi Special gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi SpecialKey gui=NONE guifg=#c7c7c7 guibg=NONE cterm=NONE ctermfg=#c7c7c7 ctermbg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#fff0f0 cterm=undercurl ctermfg=NONE ctermbg=#fff0f0
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE cterm=undercurl ctermfg=NONE ctermbg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#f0fff0 cterm=undercurl ctermfg=NONE ctermbg=#f0fff0
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#f0f0f0 cterm=undercurl ctermfg=NONE ctermbg=#f0f0f0
    hi Statement gui=NONE guifg=#6889bb guibg=NONE cterm=NONE ctermfg=#6889bb ctermbg=NONE
    hi StatusLine gui=NONE guifg=#292929 guibg=#f0f0f0 cterm=NONE ctermfg=#292929 ctermbg=#f0f0f0
    hi StatusLineNC gui=NONE guifg=#a1a1a1 guibg=#f0f0f0 cterm=NONE ctermfg=#a1a1a1 ctermbg=#f0f0f0
    hi StorageClass gui=NONE guifg=#4f4f4f guibg=NONE cterm=NONE ctermfg=#4f4f4f ctermbg=NONE
    hi String gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi TabLine gui=NONE guifg=#a1a1a1 guibg=#f0f0f0 cterm=NONE ctermfg=#a1a1a1 ctermbg=#f0f0f0
    hi TabLineFill gui=NONE guifg=NONE guibg=#f0f0f0 cterm=NONE ctermfg=NONE ctermbg=#f0f0f0
    hi TabLineSel gui=NONE guifg=#292929 guibg=#f0f0f0 cterm=NONE ctermfg=#292929 ctermbg=#f0f0f0
    hi Title gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE cterm=standout ctermfg=NONE ctermbg=NONE
    hi Type gui=NONE guifg=#6889bb guibg=NONE cterm=NONE ctermfg=#6889bb ctermbg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi VertSplit gui=NONE guifg=#e8e8e8 guibg=NONE cterm=NONE ctermfg=#e8e8e8 ctermbg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#e8e8e8 cterm=NONE ctermfg=NONE ctermbg=#e8e8e8
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#fff0f0 cterm=NONE ctermfg=NONE ctermbg=#fff0f0
    hi WildMenu gui=NONE guifg=NONE guibg=#d9d9d9 cterm=NONE ctermfg=NONE ctermbg=#d9d9d9
    hi lCursor gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
elseif &background == "dark"
    hi Boolean gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi ColorColumn gui=NONE guifg=NONE guibg=#171717 cterm=NONE ctermfg=NONE ctermbg=#171717
    hi Comment gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Conceal gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi Conditional gui=NONE guifg=#d64b38 guibg=NONE cterm=NONE ctermfg=#d64b38 ctermbg=NONE
    hi Constant gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi Cursor gui=reverse guifg=NONE guibg=NONE cterm=reverse ctermfg=NONE ctermbg=NONE
    hi CursorColumn gui=NONE guifg=NONE guibg=#171717 cterm=NONE ctermfg=NONE ctermbg=#171717
    hi CursorLine gui=NONE guifg=NONE guibg=#171717 cterm=NONE ctermfg=NONE ctermbg=#171717
    hi CursorLineNr gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi DiffAdd gui=NONE guifg=NONE guibg=#082608 cterm=NONE ctermfg=NONE ctermbg=#082608
    hi DiffChange gui=NONE guifg=NONE guibg=#171717 cterm=NONE ctermfg=NONE ctermbg=#171717
    hi DiffDelete gui=NONE guifg=NONE guibg=#260808 cterm=NONE ctermfg=NONE ctermbg=#260808
    hi DiffText gui=NONE guifg=NONE guibg=#383838 cterm=NONE ctermfg=NONE ctermbg=#383838
    hi Directory gui=NONE guifg=#999999 guibg=NONE cterm=NONE ctermfg=#999999 ctermbg=NONE
    hi Error gui=NONE guifg=NONE guibg=#260808 cterm=NONE ctermfg=NONE ctermbg=#260808
    hi ErrorMsg gui=NONE guifg=NONE guibg=#260808 cterm=NONE ctermfg=NONE ctermbg=#260808
    hi FoldColumn gui=NONE guifg=#696969 guibg=NONE cterm=NONE ctermfg=#696969 ctermbg=NONE
    hi Folded gui=NONE guifg=#787878 guibg=NONE cterm=NONE ctermfg=#787878 ctermbg=NONE
    hi Ignore gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi IncSearch gui=NONE guifg=NONE guibg=#383838 cterm=NONE ctermfg=NONE ctermbg=#383838
    hi LineNr gui=NONE guifg=#696969 guibg=NONE cterm=NONE ctermfg=#696969 ctermbg=NONE
    hi MatchParen gui=NONE guifg=NONE guibg=#383838 cterm=NONE ctermfg=NONE ctermbg=#383838
    hi ModeMsg gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi MoreMsg gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi NonText gui=NONE guifg=#696969 guibg=NONE cterm=NONE ctermfg=#696969 ctermbg=NONE
    hi Normal gui=NONE guifg=#b8b8b8 guibg=#080808 cterm=NONE ctermfg=#b8b8b8 ctermbg=#080808
    hi Number gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi Pmenu gui=NONE guifg=NONE guibg=#171717 cterm=NONE ctermfg=NONE ctermbg=#171717
    hi PmenuSbar gui=NONE guifg=NONE guibg=#292929 cterm=NONE ctermfg=NONE ctermbg=#292929
    hi PmenuSel gui=NONE guifg=NONE guibg=#383838 cterm=NONE ctermfg=NONE ctermbg=#383838
    hi PmenuThumb gui=NONE guifg=NONE guibg=#474747 cterm=NONE ctermfg=NONE ctermbg=#474747
    hi Question gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi Search gui=NONE guifg=NONE guibg=#292929 cterm=NONE ctermfg=NONE ctermbg=#292929
    hi SignColumn gui=NONE guifg=#696969 guibg=NONE cterm=NONE ctermfg=#696969 ctermbg=NONE
    hi Special gui=NONE guifg=#d64b38 guibg=NONE cterm=NONE ctermfg=#d64b38 ctermbg=NONE
    hi SpecialKey gui=NONE guifg=#696969 guibg=NONE cterm=NONE ctermfg=#696969 ctermbg=NONE
    hi SpellBad gui=undercurl guisp=NONE guifg=NONE guibg=#260808 cterm=undercurl ctermfg=NONE ctermbg=#260808
    hi SpellCap gui=undercurl guisp=NONE guifg=NONE guibg=NONE cterm=undercurl ctermfg=NONE ctermbg=NONE
    hi SpellLocal gui=undercurl guisp=NONE guifg=NONE guibg=#082608 cterm=undercurl ctermfg=NONE ctermbg=#082608
    hi SpellRare gui=undercurl guisp=NONE guifg=NONE guibg=#292929 cterm=undercurl ctermfg=NONE ctermbg=#292929
    hi Statement gui=NONE guifg=#d64b38 guibg=NONE cterm=NONE ctermfg=#d64b38 ctermbg=NONE
    hi StatusLine gui=NONE guifg=#a8a8a8 guibg=#292929 cterm=NONE ctermfg=#a8a8a8 ctermbg=#292929
    hi StatusLineNC gui=NONE guifg=#787878 guibg=#292929 cterm=NONE ctermfg=#787878 ctermbg=#292929
    hi StorageClass gui=NONE guifg=#999999 guibg=NONE cterm=NONE ctermfg=#999999 ctermbg=NONE
    hi String gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi TabLine gui=NONE guifg=#787878 guibg=#292929 cterm=NONE ctermfg=#787878 ctermbg=#292929
    hi TabLineFill gui=NONE guifg=NONE guibg=#292929 cterm=NONE ctermfg=NONE ctermbg=#292929
    hi TabLineSel gui=NONE guifg=#a8a8a8 guibg=#292929 cterm=NONE ctermfg=#a8a8a8 ctermbg=#292929
    hi Title gui=NONE guifg=#878787 guibg=NONE cterm=NONE ctermfg=#878787 ctermbg=NONE
    hi Todo gui=standout guifg=NONE guibg=NONE cterm=standout ctermfg=NONE ctermbg=NONE
    hi Type gui=NONE guifg=#d64b38 guibg=NONE cterm=NONE ctermfg=#d64b38 ctermbg=NONE
    hi Underlined gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi VertSplit gui=NONE guifg=#383838 guibg=NONE cterm=NONE ctermfg=#383838 ctermbg=NONE
    hi Visual gui=NONE guifg=NONE guibg=#383838 cterm=NONE ctermfg=NONE ctermbg=#383838
    hi VisualNOS gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi WarningMsg gui=NONE guifg=NONE guibg=#260808 cterm=NONE ctermfg=NONE ctermbg=#260808
    hi WildMenu gui=NONE guifg=NONE guibg=#595959 cterm=NONE ctermfg=NONE ctermbg=#595959
    hi lCursor gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi Identifier gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
    hi PreProc gui=NONE guifg=NONE guibg=NONE cterm=NONE ctermfg=NONE ctermbg=NONE
endif
