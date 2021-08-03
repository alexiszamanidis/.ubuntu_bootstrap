syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number relativenumber
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set paste

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" this remap is used for fzf palette
nnoremap <C-p> :Files<Cr>

" save file
inoremap <C-s> <esc>:w<cr>
nnoremap <C-s> :w<cr>
" save file and exit
inoremap <C-d> <esc>:wq!<cr>
nnoremap <C-d> :wq!<cr>
" quit file discarding changes
inoremap <C-q> <esc>:qa!<cr>
nnoremap <C-q> :qa!<cr>
" copy line
inoremap <C-c> Y
nnoremap <C-c> Y
" paste
" inoremap <C-v> p
" nnoremap <C-v> p
" delete line
inoremap <C-x> dd
nnoremap <C-x> dd
" undo
inoremap <C-z> u
nnoremap <C-z> u
