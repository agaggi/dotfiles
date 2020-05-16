# Gnome Terminal Configuration

## Color scheme

To obtain color schemes, [Gogh](https://github.com/Mayccoll/Gogh) has a variety of themes.

> You will need to create a **default** profile in gnome-terminal or an unexpected error may occur

Run the corresponding shell script to the theme you desire. For example:

```bash
./gruvbox.sh
```

Then change the newly created profile to the default.

### Note

The color hex value for the `hard` color scheme for gruvbox is `#1D2021`

## Zsh Shell

Install zsh via your package manager. For debian:

```bash
sudo apt install zsh
```

[Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) can be found here along with the installation instructions.

### Plugins

The files within `zsh-plugins` will need to go in this specific folder:

```bash
/usr/share/zsh/plugins
```