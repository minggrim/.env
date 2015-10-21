"it's LiamLiao vimrc
filetype on
filetype plugin on
map <F2> <Esc> : NERDTreeToggle<CR>
map <F3> <Esc> : TlistToggle<CR>
map <F4> : set nu!<BAR>set nonu?<CR>

" switch between big5 & utf8
map <F5> :set tenc=big5<cr>
map <F6> :set tenc=utf-8<cr>

" highlight search result
set hlsearch
set statusline+=%Fi


" this makes the mouse paste a block of text without formatting it
" (good for code)
map <MouseMiddle> <esc>"*p
