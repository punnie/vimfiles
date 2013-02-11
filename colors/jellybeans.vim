" Vim color file
"
"  "    __       _ _       _                             "
"  "    \ \  ___| | |_   _| |__   ___  __ _ _ __  ___    "
"  "     \ \/ _ \ | | | | |  _ \ / _ \/ _  |  _ \/ __|   "
"  "  /\_/ /  __/ | | |_| | |_| |  __/ |_| | | | \__ \   "
"  "  \___/ \___|_|_|\__  |____/ \___|\____|_| |_|___/   "
"  "                 \___/                               "
"
"         "A colorful, dark color scheme for Vim."
"
" File:         jellybeans.vim
" Maintainer:   NanoTech <http://nanotech.nanotechcorp.net/>
" Version:      1.2
" Last Change:  May 26th, 2009
" Contributors: Daniel Herbert <http://pocket-ninja.com>,
"               Henry So, Jr. <henryso@panix.com>,
"               David Liang <bmdavll at gmail dot com>
"
" Copyright (c) 2009 NanoTech
"
" Permission is hereby granted, free of charge, to any person obtaining a copy
" of this software and associated documentation files (the "Software"), to deal
" in the Software without restriction, including without limitation the rights
" to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
" copies of the Software, and to permit persons to whom the Software is
" furnished to do so, subject to the following conditions:
"
" The above copyright notice and this permission notice shall be included in
" all copies or substantial portions of the Software.
"
" THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
" IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
" FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
" AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
" LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
" OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
" THE SOFTWARE.

set background=dark

hi clear

if exists("syntax_on")
	syntax reset
endif

let g:colors_name = "jellybeans"

if version >= 700
  hi CursorLine guifg=NONE guibg=#1c1c1c
  hi CursorColumn guifg=NONE guibg=#1c1c1c
  hi MatchParen guifg=#ffffff guibg=#80a090 gui=bold

  hi TabLine guifg=#000000 guibg=#b0b8c0 gui=italic
  hi TabLineFill guifg=#9098a0 guibg=NONE
  hi TabLineSel guifg=#000000 guibg=#f0f0f0 gui=italic,bold

  " Auto-completion
  hi Pmenu guifg=#ffffff guibg=#000000
  hi PmenuSel guifg=#101010 guibg=#eeeeee
endif

hi Visual guifg=NONE guibg=#404040
hi Cursor guifg=NONE guibg=#b0d0f0

hi Normal guifg=#e8e8d3 guibg=#151515
hi LineNr guifg=#605958 guibg=#151515
hi Comment guifg=#888888 gui=italic
hi Todo guifg=#808080 gui=bold

hi StatusLine guifg=#f0f0f0 guibg=#101010 gui=italic
hi StatusLineNC guifg=#a0a0a0 guibg=#181818 gui=italic
hi VertSplit guifg=#181818 guibg=#181818 gui=italic

hi Folded guifg=#a0a8b0 guibg=#384048 gui=italic
hi FoldColumn guifg=#a0a8b0 guibg=#384048
hi SignColumn guifg=#a0a8b0 guibg=#384048

hi Title guifg=#70b950 guibg=NONE gui=bold

hi Constant guifg=#cf6a4c guibg=NONE
hi Special guifg=#799d6a guibg=NONE
hi Delimiter guifg=#668799 guibg=NONE

hi String guifg=#99ad6a guibg=NONE
hi StringDelimiter guifg=#556633 guibg=NONE

hi Identifier guifg=#c6b6ee guibg=NONE
hi Structure guifg=#8fbfdc guibg=NONE
hi Function guifg=#fad07a guibg=NONE
hi Statement guifg=#8197bf guibg=NONE
hi PreProc guifg=#8fbfdc guibg=NONE

hi link Operator Normal

hi Type guifg=#ffb964 guibg=NONE
hi NonText guifg=#808080 guibg=#151515

hi SpecialKey guifg=#808080 guibg=#343434

hi Search guifg=#f0a0c0 guibg=#302028 gui=underline

hi Directory guifg=#dad085 guibg=NONE
hi ErrorMsg guifg=NONE guibg=#902020
hi link Error ErrorMsg

" Diff

hi link diffRemoved Constant
hi link diffAdded String

" VimDiff

hi DiffAdd guifg=NONE guibg=#043021
hi DiffChange guifg=NONE guibg=#180d30
hi DiffDelete guifg=#300000 guibg=#300000
hi DiffText guifg=NONE guibg=#093030

" PHP

hi link phpFunctions Function
hi StorageClass guifg=#c59f6f guibg=NONE
hi link phpSuperglobal Identifier
hi link phpQuoteSingle StringDelimiter
hi link phpQuoteDouble StringDelimiter
hi link phpBoolean Constant
hi link phpNull Constant
hi link phpArrayPair Operator

" Ruby

hi link rubySharpBang Comment
hi rubyClass guifg=#447799 guibg=NONE
hi rubyIdentifier guifg=#c6b6fe guibg=NONE

hi rubyInstanceVariable guifg=#c6b6fe guibg=NONE
hi rubySymbol guifg=#7697d6 guibg=NONE
hi link rubyGlobalVariable rubyInstanceVariable
hi link rubyModule rubyClass
hi rubyControl guifg=#7597c6 guibg=NONE

hi link rubyString String
hi link rubyStringDelimiter StringDelimiter
hi link rubyInterpolationDelimiter Identifier

hi rubyRegexpDelimiter guifg=#540063 guibg=NONE
hi rubyRegexp guifg=#dd0093 guibg=NONE
hi rubyRegexpSpecial guifg=#a40073 guibg=NONE

hi rubyPredefinedIdentifier guifg=#de5577 guibg=NONE

" JavaScript
hi link javaScriptValue Constant
hi link javaScriptRegexpString rubyRegexp

" Objective-C/Cocoa
hi link objcClass Type
hi link cocoaClass objcClass
hi link objcSubclass objcClass
hi link objcSuperclass objcClass
hi link objcDirective rubyClass
hi link cocoaFunction Function
hi link objcMethodName Identifier
hi link objcMethodArg Normal
hi link objcMessageName Identifier

" Tag list
hi link TagListFileName Directory
