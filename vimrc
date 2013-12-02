set ic
set dictionary+=/usr/share/dict/words

" setlocal means only to this fils
map ,ss : setlocal spell!<cr>  
filetype plugin on
ia myname <c-r>%<cr>





"pahogen init
execute pathogen#infect()
syntax on
filetype plugin indent on
