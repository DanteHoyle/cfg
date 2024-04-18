# File: .zshrc
# Description: Main configuration file for zsh

# Checks if nvim is installed, if not sets vim as edtior
command -v nvim >/dev/null && EDITOR=nvim || EDITOR=vim

# History settings
HISTSIZE=10000
SAVEHIST=10000

# Aliases
alias cfg="git --git-dir=/home/dante/.cfg --work-tree=/home/dante"
alias notes="nvim ~/notes"
alias ls="ls --color=auto"

# Enables colors
autoload -U colors && colors

# Prompt
PS1="%(?..%B(%?%)%b)%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# Add to path
path+=("$HOME/.local/bin")

# Enables emacs mode
bindkey -e

# Attemps to load arch path, followed by debian / fedora path if that fails
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null

test -z "$TMUX" 2>/dev/null && (tmux attach || tmux new-session -d) 
return 0
