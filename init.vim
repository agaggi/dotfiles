" Installs vim-plug if it is not installed
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))

  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" User Interface
set number relativenumber
set ruler					          " Shows current cursor position (row, col) 
set showmatch
set showcmd					        " Shows commands as you type
set mouse=a					        " Enables mouse functionality
set laststatus=2
set noshowmode				      " Hides default mode shower at the bottom
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
call plug#begin()

Plug 'arcticicestudio/nord-vim'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'

call plug#end()

" Theming
colorscheme nord
let g:lightline = {'colorscheme': 'nord'}

" NERDTree 
map <C-z> :NERDTreeToggle<CR>   " CTRL + Z -- toggles NERDTree

" If the last window open is NERDTree, then it will automatically close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
