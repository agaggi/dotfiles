" User Interface

set background=dark		" Makes the background darker (for gruvbox)
set relativenumber		" Line numbers are relative to where you are
set number				" Sets the line numbers
set ruler				" Displays the location of the cursor
set showmatch			" Shows matching parenthesis-like characters
set showcmd				" Shows the last command entered
set mouse=a				" Enables mouse functionality
set laststatus=2		" Adds the bottom bar
set noshowmode			" Removes things such as --INSERT--
set encoding=utf-8		" Required for YouCompleteMe plugin

" Formatting

syntax on	          	 		" Enables syntax processing
filetype plugin indent on		" Loads file specific indenting and plugins
set autoindent					" Lines inherit previous line indentation
set wrap						" Wraps text that extends screen length
set tabstop=4 softtabstop=4		" Makes a tab count as 4 spaces
set colorcolumn=80				" 80 character limit

" Searching

set incsearch			" Searches characters as they are entered
set hlsearch			" Highlights search matches
set ignorecase			" Ignores case when searching
set smartcase			" Switch to case sensitive when uppercase is typed

" Plugins

call plug#begin(expand('~/.vim/plugged'))

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentline'

call plug#end()


" gruvbox
colorscheme gruvbox


"NERDTree 
map <C-z> :NERDTreeToggle<CR>   " Control + z toggles Nerd Tree

" If the last window open is Nerd Tree, then it will automatically close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" lightline.vim
let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }	


" indentLine
let g:indentLine_char = '¦'
