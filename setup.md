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
    - Ensure you have `cmake` package installed (assuming Manjaro)

## Konsole Terminal Emulator

### Fish Shell

Copy `config.fish` to `~/.config/fish/` and reload the terminal

### Bash Shell

Erase the contents of the default `.bashrc` and insert the following:

```bash
source $HOME/{path to dotfiles/bashrc}
```

### Nord Colorscheme

Copy the `nord.colorscheme` file to the local configuration directory `~/.local/share/konsole`. Then:

1. Open the Settings menu and select *Edit Current Profile*
2. Switch to the *Appearance* tab
3. Select `Nord` from the list

### Settings

- Window size 90 x 30
- Hide scrollbar
