# Gnome Terminal Configuration

## Color scheme

To obtain color schemes, [Gogh](https://github.com/Mayccoll/Gogh) has a variety of themes.

> You will need to create a **default** profile in gnome-terminal or an error may occur

Run the respective shell script to the theme you desire. For example:

```bash
./gruvbox.sh
```

Then change the newly created profile to the default.

## Zsh Shell

Install zsh via your package manager.

```bash
# Ubuntu
sudo apt install zsh

# Manjaro
sudo pacman -S zsh
```

To change shells, run `chsh -s /usr/zsh`.

[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) can be found here along with the installation instructions.

Run this command to install `Oh My Zsh`:

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Plugins

The files within `zsh-plugins` will need to go in this specific folder:

```bash
/usr/share/zsh/plugins
```