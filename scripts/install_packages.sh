#!/bin/bash

# Checks which distro is running.
if [ -f /etc/os-release ]; then
    source /etc/os-release
    if [ -n "$NAME" ];n
        set distro $NAME
    fi
fi

