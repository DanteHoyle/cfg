# dotfiles
My dotfiles for Linux enviornments

## Programs
- [fish](https://fishshell.com/)
- [vim](https://www.vim.org/)
- [tmux](https://github.com/tmux/tmux/wiki)


## Config Directories
| Program | Files | Directory|
|--|--|--|
| fish | config.fish | uses $__fish_config_dir as directory to put config files |
| vim | vimrc | Assumed to be ~/.vim |
| tmux | tmux.conf | Assumed to be the user's home directory

## Scripts
**Dangerous**

Scripts are written in fish, and are in the scripts/ subdirectory.
Run scripts from the dotfiles directory

## Ideas for features
- Allow user to set silent output

- Backing Up Files

    - It would be smart to first check if the directories exist before starting the copying operations. Another failrure handling method would be to keep the current logic, but allowing the user to decide if they want to keep going if there's a failed copy.

### `sync_source_to_live.sh`

### `sync_live_to_source.sh`