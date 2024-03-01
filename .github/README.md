# [dotfiles](https://github.com/DanteHoyle/dotfiles)

Inspired by this [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)

## Installation 

### Prerequisites
- gcc/g++
- fd
- python

### Setup

```sh
$ alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
$ git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg
$ config config status.showUntrackedFiles no
$ config checkout --force
```

## Features
### Programs
- [kitty](https://sw.kovidgoyal.net/kitty/)
- [fish](https://fishshell.com/)
- [foot](https://codeberg.org/dnkl/foot)
- [neovim](https://neovim.io/)
- [vim](https://www.vim.org/)
- [tmux](https://github.com/tmux/tmux/wiki)


## Plugins
In general, I'm fine with running plugins on my host machine, and try to keep config on remote machines as minimal as possible.

### Neovim
Package Managaer: lazy.nvim

### Tmux
Package Manager: tpm
