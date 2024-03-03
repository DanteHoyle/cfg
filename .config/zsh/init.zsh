# File: init.zsh
# enable Colors and change propmt
autoload -U colors && colors

source $HOME/.config/zsh/aliases.zsh
source $HOME/.config/zsh/environment.zsh
source $HOME/.config/zsh/prompt.zsh

# tab complete
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)           # enable hidden files


# use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

bindkey -e
# attempt to load aliases

# load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load zsh-autosuggestions for fish-like suggestions 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
