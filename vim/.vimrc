"it's LiamLiao vimrc
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" " alternatively, pass a path where Vundle should install plugins
" "let path = '~/some/path/here'
" "call vundle#rc(path)
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/vundle'
Plugin 'syntastic'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between here and filetype plugin indent on.
" " scripts on GitHub repos
" Plugin 'tpope/vim-fugitive'
" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'tpope/vim-rails.git'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " scripts from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Plugin 'FuzzyFinder'
" " scripts not on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " ...
"
filetype plugin indent on     " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList          - list configured plugins
" " :PluginInstall(!)    - install (update) plugins
" " :PluginSearch(!) foo - search (or refresh cache first) for foo
" " :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
" "
" " see :h vundle for more details or wiki for FAQ
" " NOTE: comments after Plugin commands are not allowed.
" " Put your stuff after this line
" vim +PluginInstall +qall 
filetype on
filetype plugin on
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
