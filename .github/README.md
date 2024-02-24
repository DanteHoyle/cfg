# dotfiles

Inspired by this [Atlassian guide](https://www.atlassian.com/git/tutorials/dotfiles)

## Programs
- [fish]()
- [foot]()
- [neovim]()
- [tmux]()


## Prerequisites

- Unless you want to type this string, setup an alias before moving on to the Setup`alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME`


## Setup

1. `$ git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg`
2. `$ config config status.showUntrackedFiles no`
3. `$ config checkout --force`
