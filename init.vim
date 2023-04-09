lua require('plugins')
lua require('preferences')

"Unify clipboard
set clipboard+=unnamed 	"use clipboards of vim and win
set paste "paste from a windows or vim

"Change nvim copy/paste to use system copy/paste
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>Y "+Y

vnoremap <C-S-c> "*y
vnoremap <C-S-v> "*p
