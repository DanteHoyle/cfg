# [dotfiles](https://github.com/DanteHoyle/dotfiles)

Inspired by this [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)

## Installation 

### Prerequisites
- Neovim Development Version
- FantasqueSansM Nerd Font Mono ([Install Here](https://www.nerdfonts.com/font-downloads))
- g++
- python
- fd
- tree-sitter-cli

### Setup

```sh
$ alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
$ git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg
$ config config status.showUntrackedFiles no
$ config checkout --force
```

## Configuration
Where possible, configuration files have been set to ~/.config, which is normally the default directory for `$XDG_CONFIG_DIRS`

## Features
### Programs & Core Plugins
#### Terminal Emulator
- [kitty](https://sw.kovidgoyal.net/kitty/) 

#### Interactive Shell
- [fish](https://fishshell.com/)

#### Text Edtior & Notes
- [neovim](https://neovim.io/)
- [neorg](https://github.com/nvim-neorg/neorg)
- [vim](https://www.vim.org/)

#### Tools
- [tmux](https://github.com/tmux/tmux/wiki)

## Plugins
In general, I'm fine with running plugins on my host machine, and try to keep config on remote machines as minimal as possible.

### Neovim
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [catppuccin](https://github.com/catppuccin/nvim)
- [neorg](https://github.com/nvim-neorg/neorg)
- [nvim-tree](https://github.com/nvim-tree/nvim-tree.lua)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [plenary](https://github.com/nvim-lua/plenary.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [which-key](https://github.com/folke/which-key.nvim)

### Tmux
- [tpm](https://github.com/tmux-plugins/tpm)
- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible)
