" Vim syntax file
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

"numnber

highlight link potionKeyword Keyword
highlight link potionFunction Function

syntax match potionComment "\v#.*$"
syntax match potionNumber "\v\d"

highlight link potionComment Comment
highlight link potionNumber Number


syntax match potionOperator "\v\*"
syntax match potionOperator "\v/"
syntax match potionOperator "\v\+"
syntax match potionOperator "\v-"
syntax match potionOperator "\v\?"
syntax match potionOperator "\v\*\="
syntax match potionOperator "\v/\="
syntax match potionOperator "\v\+\="
syntax match potionOperator "\v-\="

highlight link potionOperator Operator


syntax region potionString start=/\v"/ skip=/\v\\./ end=/\v"/
highlight link potionString String
