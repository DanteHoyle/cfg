#!/bin/bash

# Checks which distro is running.
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ -n "$NAME" ];n
        set distro $NAME
    fi
fi

if [ $distro = "Fedora" ]
    dnf -y install $( cat scritps/fedora-packages.txt ) 
fi