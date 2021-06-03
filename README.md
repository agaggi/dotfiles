# Desktop Environment Configuration

## Vim

Make a new `.vimrc` in your home directory and insert the following:

```bash
source $HOME/{path to dotfiles/vimrc}
```

### Installing Vim-Plug 

Run the following command in the terminal to download vim-plug:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

A directory will then be created in `~/.vim` and plugins can now be directly installed in vim with `:PlugInstall` in normal mode.

### Links to Plugins

- [nord-vim](https://github.com/arcticicestudio/nord-vim)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
    - A list of themes can be found [here](https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md).
- [The NERDTree](https://github.com/preservim/nerdtree)
- [YouCompleteMe](https://github.com/ycm-core/YouCompleteMe)
    - Ensure you have `cmake` installed, as well as any other dependencies.

## Alacritty

Copy the config file to `~/.config/alacritty/alacritty.yml`:

```bash
mkdir ~/.config/alacritty
cp alacritty.yml ~/.config/alacritty/alacritty.yml
```

## PCManFM

Change the following settings: 

- Set left side to *Directory Tree*
- Preferences > General > Default view: **Detailed list view**
- Preferences > Display > Size of small icons: **32x32**

For theming, run `lxappearance` and select the `arc-dark` theme.
