" """"""""""""""""""""""""""""""  origin my /etc/vimrc
" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
" set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
" set autowrite		" Automatically save before commands like :next and :make

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set number
set expandtab  "tab to spaces if want to insert tab use Ctrl-V<Tab> key sequence.
set tabstop=2
if has('moues')
	set mouse=a
endif
set selection=exclusive
set selectmode=mouse,key
"行间交错为4字节
set shiftwidth=2


 " set different indent level for other languages
autocmd FileType c setlocal shiftwidth=4 tabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4


set ruler
set wrap
set linebreak
"自动对齐
set autoindent
"不自动备份
set nobackup
"在输入括号时光标会短暂的跳到与之匹配的括号处 不影响输入
set showmatch
"设置状态栏
"set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,    %c%V%)\ %P
if has('multi_byte') && v:version > 601
	if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
    	set ambiwidth=double
	endif
endif

" key mapping to erase browing long lines
noremap  <C-j> gj
noremap  <C-k> gk
noremap  <Down> gj
noremap  <Up> gk
"inoremap <Down> <C-o>gj
"inoremap <Up> <C-o>gk
imap    <silent> <C-J> <C-O>j
imap    <silent> <C-k> <C-O>k
imap    <silent> <C-h> <C-O>h
imap    <silent> <C-l> <C-O>l

"---------------键盘映射------------------"
nmap <silent> <F2> 		 :noh<CR>
imap <silent> <F2> <esc> :noh<CR>

" paste model
set pastetoggle=<f4>


"test----delete all space in the start of lines"
nmap <silent> <F3> 		::%s/^\s\+//g<CR>

"智能对齐
"set smartindent

"自动缩进
"set ai!
"允许backspace和光标跨越行边界
set whichwrap+=<,>,h,l


" set fileencodings = utf-8, gbk
set ambiwidth=double
colorschem desert
"搜索设置
set hlsearch
"随输入增量搜索
set incsearch

"---------------编程设置----------"


"自动纠错“
iab szie size
iab slef self
iab prinft printf
iab infreface interface
iab retrun return
iab StdOUnt StdOut
iab StdOunt StdOut
iab incldue include
iab inlcude include
iab destory destroy

" if has('autocmd')
function! RemoveTrailingSpace()
 if $VIM_HATE_SPACE_ERRORS != '0' &&
 \(&filetype == 'c' || &filetype == 'cpp' || &filetype == 'vim')
  normal m`
  silent! :%s/\s\+$//e
  normal ``
 endif
endfunction

" replace table by space
function! ReplaceTableWithSpaceAndRemoveTrailingSpace()
  silent! :%s /\t/  /g
  silent! :%s/\s\+$//e
endfunction

" function! RemoveTrailingSpace()
"   normal m`
"   silent! :%s/\s\+\$//e
"   normal ``
" endfunction

" Highlight space errors in C/C++ source files (Vim tip #935)
if $VIM_HATE_SPACE_ERRORS != '0'
  let c_space_errors=1
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""my .vimrc"""""""""""""""""""""""""""""""""



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
set softtabstop=2

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
set path+=/home/klc/.rvm/rubies/ruby-2.0.0-p353/lib/ruby/2.0.0


"""""""""""""set - not a a componment, the original value not include -,
"    that i can search i-ma-hello,   most in css
"
"
autocmd FileType css setlocal iskeyword=@,48-57,_,192-255,-,$
autocmd FileType less setlocal iskeyword=@,48-57,_,192-255,-,$
autocmd FileType html setlocal iskeyword=@,48-57,_,192-255,-,$
autocmd FileType javascript setlocal iskeyword=@,48-57,_,192-255,-,$


""""""""""""  recongnize new file type
au BufNewFile,BufRead *.less set filetype=less



" setlocal means only to this file
map ,ss : setlocal spell!<cr>
filetype plugin on
ia myname <c-r>%<cr>

"some map
";; to save file
imap ,, <ESC>
imap jj <ESC>l
"normal mode ; and : exchange
nnoremap  ;   :

"key mapping for the taglist.vim plugin
nmap <F8>      :Tlist<CR>
imap <F8> <C-O>:Tlist<CR>


" NerdTree
nmap <F9>      :NERDTreeToggle<CR>
imap <F9> <C-O>:NERDTreeToggle<CR>

",w to save
nmap  ,w  :w<CR>

",f to quit!
map  ,f :quit!<CR>

",e open .vimrc file
noremap ,e  <ESC>:e ~/.vim/vimrc<CR>
",s open keyshorts 
noremap ,s  <ESC>:e ~/NOTES/keyshorts.note<CR>
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



"""""""""""""""""""""""""""""""
"
"   tcomment
"
""""""""""""""""""""""""""""""""
    "use ctrl-c to comment and uncomment
map <C-c>  gcc<esc>


""""""""""""""""""""""""""
"
"       ctrlp
"
""""""""""""""""""""""""""
let g:ctrlp_map = ',,'
let g:ctrlp_open_multiple_files = 'v'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(log|jpg|png|jpeg)$',
  \ }

""""""""""""""""""""""""""""""""""""""""
"
""       auto-save
"
"""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1

" now if you have spaces at end of lines, you get notified
set list
set listchars=trail:+

""""""""""""""""""""""""""""""""""""""""
"
""             buffers
"
"""""""""""""""""""""""""""""""""""""""""
set hidden "in order to switch between buffers with unsaved change
map <s-tab> :bp<cr>
map <tab> :bn<cr>
map ,bd :bd<cr>

""""""""""""""""""""""""""""""""""""""""
"
"             ack
"
""""""""""""""""""""""""""""""""""""""""
map ,k :Ack <cword><ENTER>


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

