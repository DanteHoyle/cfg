# File: .zshrc
# Description: Main configuration file for zsh

# Enables colors
autoload -U colors && colors
# Set up colorful 
PS1="%(?..%B(%?%)%b)%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

source ~/.config/zsh/aliases
# Source secondary alias file not synced with git repo
if [ -e ~/.aliases2 ]; then
    source ~/.aliases2 
    echo ".zshrc: loaded .aliases2"
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$HOME/.config/zsh/zsh_history
setopt INC_APPEND_HISTORY

# Checks if nvim is installed, if not sets vim as edtior
command -v nvim >/dev/null && EDITOR=nvim || EDITOR=vim

# Changes some keybindings to behave like emacs
bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Changes behavior of tab completion
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Provides syntax highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
# Fish style autosuggestions
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# If keychain is installed 
if command -v keychain >/dev/null; then
    keychain ~/.ssh/id_ed25519
    . ~/.keychain/${HOST}-sh
fi

if command -v nvim >/dev/null; then
    alias vim="nvim"
    EDITOR="nvim"
else
    EDITOR="vim"
fi
