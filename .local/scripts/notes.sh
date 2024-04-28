#!/usr/bin/env bash
# File: notes.sh
# Description: Wrapper script for opening notes directory

DEFAULT_NOTES_DIRECTORY="$HOME/documents/notes"

# find lists all fiels in the notes directory
# grep removes listings in the .meta folder since neovim doesn't need to open images
# fzf gives me a nice user friendly selection menu. The selected file is sent to neovim.
cd $DEFAULT_NOTES_DIRECTORY && \
    nvim $( find | cut --characters="3-" | grep -v ".meta" | fzf )
