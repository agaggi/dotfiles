set shell=/bin/bash

" User Interface
set number relativenumber
set ruler
set showmatch
set showcmd
set mouse=a
set ttymouse=sgr
set laststatus=2
set noshowmode
set cursorline
set encoding=utf-8

" Formatting
syntax on
filetype plugin indent on
set autoindent
set wrap
set tabstop=4 softtabstop=4
set colorcolumn=90

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'arcticicestudio/nord-vim'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'

call plug#end()

colorscheme nord

"NERDTree 
map <C-z> :NERDTreeToggle<CR>   " Control + z toggles Nerd Tree

" If the last window open is Nerd Tree, then it will automatically close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }
