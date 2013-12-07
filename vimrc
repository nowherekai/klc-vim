""""""""""""""""
" innorecase
""""""""""""""""
set ic

"""""""""""""
"
"   auto completioni CTRL-N P X
"""""""""""""""""""""
set dictionary+=/usr/share/dict/words

""""""""""""""""""""
"   Backspace to delete 4 space if have
"
"""""""""""""""""""""""""""'
set softtabstop=4

"""""""""""""""""""
"
"   set statusline to show the decode infomation
"   see h statusline
"
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

"""""""""""""""
"
"   path to find file
"   help path
"
set path+=/usr/include/c++/4.6

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

"key mapping for the taglist.vim plugin
nmap <F9>      :Tlist<CR>
imap <F9> <C-O>:Tlist<CR>

",w to save
nmap  ,w  :w<CR>

",f to quit!
map  ,f :quit!<CR>

",e open .vimrc file
noremap ,e  <ESC>:e ~/.vim/vimrc<CR>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim/vimrc

",c open c.snippet
noremap ,c <ESC>:e ~/.vim/bundle/snipmate/snippets/c.snippets<CR>

""""""""""""""""""""
"
"   visual mode copy to the + register
"   the + * register is relative to the X's clipboard
"
""""""""""""""""""""""
vmap <C-X>   "+y

"pahogen init
execute pathogen#infect()
syntax on
filetype plugin indent on



"""""""""""""""""""""""""""""""
"
"   tcomment
"
""""""""""""""""""""""""""""""""
    "use ctrl-c to comment and uncomment
map <C-c>  gcc

""""""""""""""""""""""""""""""""""""""""
"
""             buffers
"
"""""""""""""""""""""""""""""""""""""""""
set hidden "in order to switch between buffers with unsaved change
map <s-tab> :bp<cr>
map <tab> :bn<cr>
map ,bd :bd<cr>


""""""""""""""""""""""""""""""
"
"   my Abbreviations
"
"""""""""""""""""""""""""""""
iab #b  /*******************************
iab #e  ********************************/


" Recognize standard C++ headers
au BufEnter /usr/include/c++/*    setf cpp
au BufEnter /usr/include/g++-3/*  setf cpp


" Remove trailing spaces for C/C++ and Vim files
au BufWritePre *                  call RemoveTrailingSpace()
