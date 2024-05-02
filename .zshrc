# File: .zshrc
# Description: Main configuration file for zsh

# Checks if nvim is installed, if not sets vim as edtior
command -v nvim >/dev/null && EDITOR=nvim || EDITOR=vim

# History settings
HISTSIZE=10000
SAVEHIST=10000


# Enables colors
autoload -U colors && colors

# Prompt
PS1="%(?..%B(%?%)%b)%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Enables emacs mode
bindkey -e

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Sets up automatic completions
autoload -U compinit
zstyle ":completion:*" menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Attemps to load arch path, followed by debian / fedora path if that fails
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &> /dev/null || \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh &> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null || \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh &> /dev/null

source ~/.aliases

test -z "$TMUX" 2>/dev/null && (tmux attach || tmux new-session -d) 
return 0
