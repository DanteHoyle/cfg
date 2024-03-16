#!/usr/bin/env bash

# File: startsway.sh

# catppuccin
set $ctp-version v0.7.1
exec_always if [ ! -e ~/.themes/Catppuccin-Mocha-Standard-Green-Dark ]; then \
  mkdir -p ~/.themes \
  && curl -L https://github.com/catppuccin/gtk/releases/download/$ctp-version/Catppuccin-Frappe-Standard-Green-Dark.zip -o ~/.themes/catppuccin.zip \
  && unzip ~/.themes/catppuccin.zip -d ~/.themes/ \
  && rm -rf ~/.themes/catppuccin.zip; fi

exec sway
