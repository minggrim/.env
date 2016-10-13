"it's LiamLiao vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

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

call vundle#end()            " required
filetype plugin indent on    " required

"nerdtree settings
let g:NERDTreeMapOpenSplit = 'a'

"syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_python_checkers=['flake8', 'frosted', 'pep8', 'pylint']
let g:syntastic_python_checkers = ['prospector']
let g:syntastic_python_python_use_codec = 1
set statusline+=%*
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"


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

" highlight search result
set hlsearch
set statusline+=%Fi
set cursorline
set mouse=nv

" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p
map i <Up>
map k <Down>
map j <Left>
map <S-i> <PAGEUP>
map <S-k> <PAGEDOWN>
map t <C-w>
map ti <C-w><Up>
map tk <C-w><Down>
map tj <C-w><Left>
map tl <C-w><Right>
map , <Delete><Left> 
map ; <Insert>
set t_Co=256
syntax on
set backspace=indent,eol,start
set expandtab ts=4 sw=4 ai

colorscheme adrian
