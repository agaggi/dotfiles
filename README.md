# Desktop Environment Configuration

## NeoVim

Copy `init.vim` to `~/.config/nvim/init.vim`.

Incase you need to install *vim-plug* manually: 

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Links to Plugins

- [nord-vim](https://github.com/arcticicestudio/nord-vim)
- [lightline.vim](https://github.com/itchyny/lightline.vim)
    - A list of themes can be found [here](https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md).
- [The NERDTree](https://github.com/preservim/nerdtree)

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