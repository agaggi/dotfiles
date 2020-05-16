# For future reference

## Installing Vim-Plug

Run the following command in the terminal:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
> https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

The directory will then be created and plugins can be directly installed in vim 

## Vim plugin syntax and how to install plugins

The following lines are needed when implementing plugins to .vimrc

```vim
call plug#begin()
"
" Plugins implemented here
"
call plug#end()
```

When your desired plugins are installed then run the following vim command

```vim
:PlugInstall
```

## Installation

### Links
- [Gruvbox color scheme](https://github.com/morhetz/gruvbox)
- [Lightline status bar](https://github.com/itchyny/lightline.vim)
- [Nerd Tree](https://github.com/preservim/nerdtree)
- [YouCompleteMe autocomplete](https://github.com/ycm-core/YouCompleteMe)

Add the following lines within your plugin calls in your .vimrc and run `:PlugInstall` to complete installation.

```vim
call plug#begin()

Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'ycm-core/YouCompleteMe'

call plug#end()
```

## Gruvbox
Don't forget to add the colorscheme after `call plug#end()`.

- To set to the darker theme, input `set background=dark` into your .vimrc. 
- `let g:gruvbox_contrast_dark = "hard"` changes the background to a darker shade. 
    - The color code for this shade is `#1d2021`

```vim
"
"
call plug#end()

let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

set background=dark
```

## Lightline bottom bar

The color scheme I use is `darcula`.

You can add the color scheme after `call plug#end()` by adding the following.

```vim
let g:lightline = {
    \ 'colorscheme': 'darcula',
    \
}
```

## Nerd Tree

To shift between windows, press `CR + w + w`. 

Below are useful addons:

```vim
" Makes Nerd Tree close with the active window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Binds NerdTreeToggle to Control + z
map <C-z> :NERDTreeToggle<CR>
```

## YouCompleteMe

Ensure the following packages are installed (debian):

```bash
sudo apt install build-essential cmake vim python3-dev
```

Then go to the following directory and run `install.py`:

```bash
~/.vim/plugged/YouCompleteMe/

./install.py
```