# [dotfiles](https://github.com/DanteHoyle/dotfiles)

This is a collection of personal preferences for a set of linux programs I frequently use.

## Installation
```sh
$ alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
$ git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg
$ cfg config status.showUntrackedFiles no
$ cfg checkout --force
```

## Programs
### Terminal Applications
- [ZSH](https://github.com/tmux/tmux/wiki)
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [tmux](https://github.com/tmux/tmux/wiki)
- [VIM](https://www.vim.org/)
- [NeoVIM](https://neovim.io/)
    - [lazy.nvim](https://github.com/folke/lazy.nvim)

### Desktop Linux
- [foot](https://codeberg.org/dnkl/foot)
- [sway](https://swaywm.org/)
- [waybar](https://github.com/Alexays/Waybar)

## Themes and Fonts
- [Catppuccin](https://github.com/catppuccin/catppuccin)
- [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)

## Inspiration / Sources
- [Atlassian Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)

