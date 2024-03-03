# File: .zshrc

# ENV
EDITOR=nvim
VIM_CONFIG_DIR=~/.vim
NVIM_CONFIG_DIR=~/.config/nvim
FISH_CONFIG_DIR=~/.config/fish
KITTY_CONFIG_DIR=~/.config/kitty
TMUX_CONFIG_DIR=~/.config/tmux

# aliases
alias vim="nvim"
alias cfg="git --git-dir=/home/dante/.cfg --work-tree=/home/dante"

# enable Colors and change propmt
autoload -U colors && colors
PS1="%(?..%B(%?%)%b)%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# saves history in cache directory
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

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
[ -f "$HOME/.config/aliasrc" ] && source "$HOME/.config/aliasrc"

# load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load zsh-autosuggestions for fish-like suggestions 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
