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

## Inspiration / Sources
- [Atlassian Dotfiles Tutorial](https://www.atlassian.com/git/tutorials/dotfiles)
