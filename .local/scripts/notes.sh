#!/usr/bin/env bash
# File: notes.sh
# Description: Wrapper script for opening notes directory

NOTES_DIRECTORY="~/documents/notes

cd $NOTES_DIRECTORY && \
    nvim $(fzf)
