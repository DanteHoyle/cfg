#!/bin/sh

# TODO
# - Setup alias for fish, and zsh maybe

# These are used to select which folders to delete before pulling the git repository
ROOT_FOLDERS=".cfg .github .vim"
CONFIG_FOLDERS="foot nvim sway tmux waybar"

PATHS_TO_DELETE=""

# Make sure that git is installed
if ! type git > /dev/null; then
    echo "Error, git is not installed. Exiting..."
    exit 1
elif ! $(git config --get user.email && git config --get user.email); then
    echo "Warning, git user.email and git user.email are not set"
fi

# Make sure that $HOME is set
if [ $HOME = '/home/*' ]; then
    echo "Warning: \$HOME = ${HOME} which is an unexpcted value. This could result in permanent data loss,"
    echo "Do you want to continue? (y to continue)"
    read -r input
    if [ "$input" != "y" ]; then
        exit 1
    fi
fi

# Check if root level folders already exist and warn user that they will be deleted
for folder in $ROOT_FOLDERS; do
    if [ -d "${HOME}/${folder}" ]; then
        PATHS_TO_DELETE="${PATHS_TO_DELETE} ${HOME}/${folder}"
    fi
done

# Check if .config already exist and warn user that they will be deleted
for folder in $CONFIG_FOLDERS; do
    if [ -d "${HOME}/.config/${folder}" ]; then
        PATHS_TO_DELETE="${PATHS_TO_DELETE} ${HOME}/.config/${folder}"
    fi
done

# Warn user about deleted paths
for path in $PATHS_TO_DELETE; do
    echo "${path} will be deleted if you continue"
done

# Final safety check to make sure user knows files will be deleted
echo "Do you want to continue? (y to continue)"
read -r input
if [ "$input" != "y" ]; then
    exit 1
fi

# Clean folders
for path in $PATHS_TO_DELETE; do
    rm -rf $path 
done

# Download Git Repository
git clone --bare git@github.com:DanteHoyle/dotfiles.git $HOME/.cfg
git --git-dir=$HOME/.cfg/ --work-tree=$HOME config status.showUntrackedFiles no
git --git-dir=$HOME/.cfg/ --work-tree=$HOME checkout --force