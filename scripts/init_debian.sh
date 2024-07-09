#!/bin/sh
# File: init_debian.sh
# Description: Downloads useful files for new debian installs

base="yes"
dev="yes"
fun="no"

if [ -n "$base" ]; then
    echo SCRIPT: Installing base packages
    sudo apt-get install zsh \
                         man \
                         git \
                         curl \
                         ripgrep \
                         mtr-tiny
fi

# dev tools
if [ -n "$dev" ]; then
    echo SCRIPT: Installing dev packages
    sudo apt-get install shellcheck \
                         tmux \
                         gcc \
                         keychain \
                         npm
fi

# fun programs
if [ -n "$fun" ]; then
    echo SCRIPT: Installing fun packages
    sudo apt-get install cowsay
fi
