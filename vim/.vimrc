"it's LiamLiao vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

"vundle plugin management
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'taglist.vim'
Plugin 'SrcExpl'
Plugin 'wesleyche/Trinity'
Plugin 'wolfpython/cscope_map.vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()            " required

"plug plugin management
call plug#begin()
Plug 'Shougo/unite.vim'
Plug 'devjoe/vim-codequery'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-dispatch'
Plug 'mileszs/ack.vim'
call plug#end()
filetype plugin indent on    " required

"nerdtree settings
let g:NERDTreeMapOpenSplit = 'a'

"syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers=['flake8', 'frosted', 'pep8', 'pylint']
let g:syntastic_python_checkers=['flake8', 'frosted', 'pep8']
"let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_python_use_codec = 1
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"let b:syntastic_mode = "passive"
"noremap <C-w>f :SyntasticToggleMode<CR>
noremap <C-w>c :SyntasticCheck<CR>
noremap <C-w>o :lopen<CR>
noremap <C-w>e :lclose<CR>

"##########codequery
let g:codequery_trigger_build_db_when_db_not_found = 1
nnoremap <space>c :CodeQueryMenu Unite Full<CR>
nnoremap <space>; :CodeQueryMenu Unite Magic<CR>
"enable typing (to search menu items) by default
nnoremap <space>\ :CodeQueryMenu Unite Magic<CR>A
nnoremap <space><CR> :CodeQuery Symbol<CR>
" Chain commands to find possible tests (for python)
nnoremap <space>t :CodeQuery Caller<CR>:CodeQueryFilter test_<CR>

"key mappings
nmap <F8> :TrinityToggleAll<CR>
nmap <F2> :TrinityToggleTagList<CR> 
nmap <F3> :TrinityToggleNERDTree<CR> 
nmap <F4> :TrinityToggleSourceExplorer<CR> 
nmap <S-s> :w<CR>
" switch between big5 & utf8
map <F5> :set tenc=big5<cr>
map <F6> :set tenc=utf-8<cr>
map <F7> : set nu!<BAR>set nonu?<CR>

" show colume number
set statusline+=col:\ %c,
" highlight search result
set hlsearch
set statusline+=%F
set cursorline
set mouse=nv

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p
"map i <Up>
"map k <Down>
"map j <Left>
map <S-k> <PAGEUP>
map <S-j> <PAGEDOWN>
map t <C-w>
map tk <C-w><Up>
map tj <C-w><Down>
map th <C-w><Left>
map tl <C-w><Right>
map , <Delete><Left> 
map ; <Insert>
set t_Co=256
syntax on
set backspace=indent,eol,start
set expandtab ts=4 sw=4 ai
set clipboard=unnamedplus
"
"color scheme
colorscheme wombat256mod

" cscope settings and shortkeys
set cscopetag
set csto=0
if filereadable("cscope.out")
    cs add cscope.out
elseif $CSCOPE_DB != ""
    cs add $CSCOPE_DB
endif

"bellow will print the db already exist
"set cscopeverbose

set cscoperelative

"find C symbol
nmap zs :cs find s <C-R>=expand("<cword>")<CR><CR>
"find name definition
nmap zg :cs find g <C-R>=expand("<cword>")<CR><CR>
"find name caller
nmap zc :cs find c <C-R>=expand("<cword>")<CR><CR>
"find name string
nmap zt :cs find t <C-R>=expand("<cword>")<CR><CR>
"egrep
nmap ze :cs find e <C-R>=expand("<cword>")<CR><CR>
"find file
nmap zf :cs find f <C-R>=expand("<cfile>")<CR><CR>
"find who include this file
nmap zi :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
"find called functions in name
nmap zd :cs find d <C-R>=expand("<cword>")<CR><CR>

