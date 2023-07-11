#!/bin/bash

# Greate GitHub Repo Directory
if mkdir -p ~/git-repos ; then
    echo "~/.git-repos created"
else
    exit 1
fi

cd ~/git-repos

if git clone https://github.com/DanteHoyle/dotfiles.git ; then
    echo "https://github.com/DanteHoyle/dotfiles.git clones to ~/git-repos"
else
    exit 1
fi


