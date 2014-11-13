" Vim syntax file
" " Language: Celestia Star Catalogs
" " Maintainer: Kevin Lauder
" " Latest Revision: 26 April 2008
"
if exists("b:current_syntax")
  finish
endif

let b:current_syntax = "potion"

"Keywords
syntax keyword potionKeyword loop times to while
syntax keyword potionKeyword if elsif else
syntax keyword potionKeyword class return

"function
syntax keyword potionFunction print join string

highlight link potionKeyWord KeyWord
highlight link potionFunction Function
