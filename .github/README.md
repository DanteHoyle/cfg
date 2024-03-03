# [dotfiles](https://github.com/DanteHoyle/dotfiles)

Inspired by this [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)

## Installation 

### Prerequisites
- FantasqueSansM Nerd Font Mono ([Install Here](https://www.nerdfonts.com/font-downloads))

- For Neovim Plugins
-- g++
-- python
-- fd

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
### Programs
Terminal Emulator
- [kitty](https://sw.kovidgoyal.net/kitty/) 
Interactive Shell
- [fish](https://fishshell.com/)
Text Edtior & Notes
- [neovim](https://neovim.io/)
- [neorg](https://github.com/nvim-neorg/neorg)
- [vim](https://www.vim.org/)
Multiplexor
- [tmux](https://github.com/tmux/tmux/wiki)


## Plugins
In general, I'm fine with running plugins on my host machine, and try to keep config on remote machines as minimal as possible.

### Neovim
Package Managaer: lazy.nvim
- lazy-tree
- neorg
- telescope

### Tmux
Package Manager: tpm
