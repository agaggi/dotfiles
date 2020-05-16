# Vim Plugins

> Vim-Plug manages your plugins for vim.

## Installing Vim-Plug 

Run the following command in the terminal to download vim-plug:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
> https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

A directory will then be created in `~/.vim` and plugins can now be directly installed in vim.

## Vim-Plug syntax and commands

The following lines are needed when implementing plugins in `.vimrc`:

```vim
call plug#begin()
"
" Plugins implemented here
"
call plug#end()
```

When your desired plugins are added run the following vim command in normal mode:

```vim
:PlugInstall
```

## Configuration Procedures

### Links
- [Gruvbox](https://github.com/morhetz/gruvbox)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [The NERDTree](https://github.com/preservim/nerdtree)
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
- [indentLine](https://github.com/Yggdroot/indentLine)


## Gruvbox
After `call plug#end()`, the colorscheme needs to be added. Any plugin preferences should come **before** the colorscheme.

- To set to the darker theme, add `set background=dark` into your `.vimrc`. 
- `let g:gruvbox_contrast_dark = "hard"` changes the background to a darker shade. 
    - The color code for this shade is `#1d2021`

```vim
call plug#end()

let g:gruvbox_contrast_dark = "hard"
colorscheme gruvbox

set background=dark
```

## lightline.vim

You can add the color scheme after `call plug#end()` by adding the following:

```vim
let g:lightline = {
    \ 'colorscheme': 'darcula',
    \
}
```

A list of themes can be found [here](https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md).

## The NERDTree

> To shift between windows, press `CR + w + w`. 

Below are useful addons:

```vim
" Makes Nerd Tree close along with the active window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Binds NerdTreeToggle to Control + z
map <C-z> :NERDTreeToggle<CR>
```

## YouCompleteMe

Ensure the following packages are installed (debian):

```bash
sudo apt install build-essential cmake vim python3-dev
```

Then go to the following directory and compile `install.py`:

```bash
~/.vim/plugged/YouCompleteMe/

./install.py
```

## indentLine

Custom indentation characters can be set. For example:

```vim
let g:indentLine_char = '¦'
```