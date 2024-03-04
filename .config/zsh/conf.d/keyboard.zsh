# File: keyboard.zsh 
# Binds Ctrl + e to edit current line buffer in editor
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char
