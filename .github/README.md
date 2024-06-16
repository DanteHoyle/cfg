# [cfg.git](https://github.com/DanteHoyle/dotfiles)

This is a collection of personal dotfiles for a set of Linux programs I frequently use. It is intended to be setup as a bare repository. I mostly use Debian and Arch Linux and rely on the [Windows Subsystem for Linux](https://learn.microsoft.com/en-us/windows/wsl/install) on Windows machines. 

## Setting up cfg on a new host 

### Manual Installation
1. Clone the repository to `~/.cfg`
    ```sh
    git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg
    ```
2. Create an alias to make interacting with the bare repo easier
    ```sh
    alias cfg="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
    ```
3. Tell git to stop showing the status of untracked files
    ```sh
    cfg config status.showUntrackedFiles no
    ```
4. Sync local files to the upstream branch
    ```sh
    cfg checkout --force
    ```
## Programs and Paths
### Programs
| Program | Config Folder | Note |
|---------|---------------|------|
| [ZSH](https://github.com/tmux/tmux/wiki) | `~`: (`.aliases`, `.zshrc`,  `.zshenv`) | Install [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) and [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting). |
| [tmux](https://github.com/tmux/tmux/wiki) | `~/.config/tmux` | |
| [vim](https://www.vim.org/) | `~/.vim` | |
| [neovim](https://neovim.io/) | `~/.config/nvim` | Use `~/scripts/get_nvim.sh` to install latest version |
| [foot](https://codeberg.org/dnkl/foot) | `~/.config/foot` | Desktop Terminal Emulator |
| [sway](https://swaywm.org/) | `~/.config/sway` | Desktop Environment |
| [waybar](https://github.com/Alexays/Waybar) | `~/.config/waybar` | Desktop menubar for sway |

### Scripts
Scripts are stored in `~/scripts` and may need permissions adjusted to be executed.

| Script Name | Description | Added to path |
|---|---|---|
| `install.sh` | dotfiles installer helper script | no |
| `get_neovim.sh` | Installs neovim to `/opt` | no |


### Other Paths
| Path | Note |
|---|---|
| `~/.github` | Contains `README.md`. This is a trick to get GitHub to display the project description properly without cluttering the home directory with `~/README.md`
| `~/.cfg` | Contains the actual repo files for the bare git repo. You should never need to touch this manually. If the config files end up in this folder, you did not clone the reopsitory as a bare repo.

## Themes and Fonts
- [Catppuccin](https://github.com/catppuccin/catppuccin)
- [CaskaydiaCove Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/CascadiaCode.zip)

## Inspiration / Sources
- [Atlassian Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)