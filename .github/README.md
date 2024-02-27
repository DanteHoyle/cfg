# [dotfiles](https://github.com/DanteHoyle/dotfiles)

Inspired by this [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)

## Installation 

### Prerequisites
### Setup
1. `$ alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`
2. `$ git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg`
3. `$ config config status.showUntrackedFiles no`
4. `$ config checkout --force`

## Features
### Programs
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [fish](https://fishshell.com/)
- [foot](https://codeberg.org/dnkl/foot)
- [neovim](https://neovim.io/)
- [vim](https://www.vim.org/)
- [tmux](https://github.com/tmux/tmux/wiki)


### Color Themes
For pretty much everything, I utilize [catppuccin](https://github.com/catppuccin/catppuccin)

## Neovim
### Plugins
- catppuccin
- nvim-tree
- nvim-treesitter
- plenary
- telescope
- which-key
### Hotkeys

```
;                   - <Leader>
<F1>
<F12>               - Toggle editor between spaces and tabs (spaces default)
<Leader> + <Leader> - WhichKey
<Leader> + f        - Focus nVimTree
<Leader> + T        - Toggle nVimTree
<C-f>               - Telescope

```
