"it's LiamLiao vimrc
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
