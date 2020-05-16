" User Interface

set background=dark
set relativenumber
set number					" Sets the line numbers
set ruler					" Displays the location of the cursor
set showmatch				" Shows matching parenthesis-like characters
set showcmd					" Shows the last command entered
set mouse=a					" Enables mouse functionality
set laststatus=2			" Adds the bottom bar
set noshowmode				" Removes things such as --INSERT--

" Formatting

syntax on	          	 		" Enables syntax processing
filetype plugin indent on		" Loads file specific indenting and plugins
set autoindent					" New lines inherit previous line indentation
set wrap						" Wraps text that extends screen length
set tabstop=4 softtabstop=4		" Makes a tab count as 4 spaces
set colorcolumn=80				" 80 character limit

" Searching

set incsearch				" Searches characters as they are entered
set hlsearch				" Highlights search matches
set ignorecase				" Ignores case when searching
set smartcase				" Switch to case sensitive when uppercase is typed

" Plugins

call plug#begin(expand('~/.vim/plugged'))

Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ycm-core/YouCompleteMe'
Plug 'Yggdroot/indentline'

call plug#end()


" Gruvbox colorscheme
"------------------------------------------------------------------------------

let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox 

"------------------------------------------------------------------------------


"NERDTree 
"------------------------------------------------------------------------------
map <C-z> :NERDTreeToggle<CR>   " Control + z toggles Nerd Tree

" If the last window open is Nerd Tree, then it will automatically close
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"------------------------------------------------------------------------------


" Lightline bottombar
"------------------------------------------------------------------------------

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ }							

"------------------------------------------------------------------------------
