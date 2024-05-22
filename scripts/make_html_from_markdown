#!/usr/bin/env bash
# File: make_html_from_markdown
# Description: Wrapper script for opening notes directory

# Make sure that pandoc is installed
if ! command -v pandoc &> /dev/null
then
    echo "pandoc does not appear to be installed"
    exit 1
fi

pandoc -o ~/documents/notes/output/$1.html $1
