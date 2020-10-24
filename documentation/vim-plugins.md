# Vim Plugins

> Vim-Plug manages your plugins for vim.

## Installing Vim-Plug 

Run the following command in the terminal to download vim-plug:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
> https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

A directory will then be created in `~/.vim` and plugins can now be directly installed in vim.

### Vim-Plug syntax and commands

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
- [gruvbox](https://github.com/morhetz/gruvbox)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
- [The NERDTree](https://github.com/preservim/nerdtree)
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)

## gruvbox
After `call plug#end()`, the colorscheme needs to be added. Any plugin preferences should come **before** the colorscheme.

```vim
call plug#end()
"
" Preferences
"
colorscheme gruvbox
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

Ensure the following packages are installed:

```bash
# Ubuntu
sudo apt install build-essential cmake vim python3-dev

# Manjaro
sudo pacman -S cmake
```

Then go to the following directory and compile `install.py`:

```bash
~/.vim/plugged/YouCompleteMe/

./install.py
```
