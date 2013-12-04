set ic
set dictionary+=/usr/share/dict/words

" setlocal means only to this fils
map ,ss : setlocal spell!<cr>  
filetype plugin on
ia myname <c-r>%<cr>

"some map
";; to save file
imap ,, <ESC>:w<CR>l
imap kk <ESC>
"normal mode ; and : exchange
nnoremap  ;   :

",e open .vimrc file
inoremap ,e  <ESC>:e $HOME/.vimrc<CR>
noremap ,e  <ESC>:e $HOME/.vimrc<CR>


"pahogen init
execute pathogen#infect()
syntax on
filetype plugin indent on
