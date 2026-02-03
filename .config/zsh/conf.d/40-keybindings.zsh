# use traditional shell keybinds for the most part
bindkey -e

# allow pasting URLs and multi line commands
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# edit CLI in vim with alt + e:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line
