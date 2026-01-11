Set correct modeline for0
 ## Dotfiles

This repo contains all my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.

To install them, clone this repo to your home directory and run `stow` on the directories you want to install.
For example, to install my `nvim` configuration, run:

```sh
stow nvim
```

To uninstall, run `stow -D` instead:

```sh
stow -D nvim
```

If you want to install all the dotfiles, you can run the following command to only stow directories and avoid stowing this README file:

```sh
stow */
```

To uninstall all the dotfiles, you can run the following command:

```sh
stow -D */
```

If you do not want to clone the repository to your home directory, you can clone it to a different directory and use the `-d` flag to specify the directory:

```sh
# Just nvim
stow -d "$HOME" nvim
stow -d "$HOME" -D nvim

# All dotfiles
stow -d "$HOME" */
stow -d "$HOME" -D */
```


### Included Configurations

- `direnv` - Directory-specific environment variables
- `karabiner` - Karabiner-Elements keyboard customization (macOS)
- `kitty` - Kitty terminal emulator
- `nvim` - Neovim text editor
- `wezterm` - WezTerm terminal emulator
- `zsh` - Zsh shell configuration

### Requirements

- [GNU Stow](https://www.gnu.org/software/stow/) (for managing the dotfiles)
- [git](https://git-scm.com/) (for cloning this repo)
- [Neovim](https://neovim.io/) (for the `nvim` directory)
- [Zsh](https://www.zsh.org/) (for the `zsh` directory)
- [direnv](https://direnv.net/) (for the `direnv` directory)
- [Kitty](https://sw.kovidgoyal.net/kitty/) or [WezTerm](https://wezfurlong.org/wezterm/) (for terminal configurations)
- [Karabiner-Elements](https://karabiner-elements.pqrs.org/) (for the `karabiner` directory, macOS only)

