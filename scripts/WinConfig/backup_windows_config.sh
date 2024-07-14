#!/bin/sh
# root path for git directory (WinConfig)
script_dir=$(dirname "$(readlink -f "$0")")
# /mnt/c/$WIN_USER/
win_home=$(wslpath "$(cmd.exe /C "echo %USERPROFILE%" 2>/dev/null | tr -d '\r')")
# COPY FILES
# Copy Komorebi Config to WinConfig root
cp "$win_home/.config/komorebi.json" "$script_dir/komorebi.json"
# Copy WHKD Config to WinConfig root
cp "$win_home/.config/whkdrc" "$script_dir/whkdrc"