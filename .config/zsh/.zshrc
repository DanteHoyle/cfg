# File: .zshrc

# enables colors
autoload -U colors && colors

# custom prompt
PROMPT="%{$fg[red]%}[%{$fg[magenta]%}%(?..%B(%?%) %b)%B%{$fg[green]%}%~%{$fg[red]%}]%{$reset_color%}$%b "

# main alias file
source "$HOME/.config/zsh/aliases.zsh"

# use traditional shell keybinds for the most part
bindkey -e

# source secondary alias file not synced with git repo
if [ -e ./aliases2.zsh ]; then
    source ./aliases2.zsh
fi

# history settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE="$HOME/.cache/zsh/zshhistory"
setopt INC_APPEND_HISTORY_TIME
setopt SHARE_HISTORY

# edit line in vim with alt-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^[e' edit-command-line

# setup autocompletions
source "$HOME/.config/zsh/completion.zsh"

# sync ssh-agent with keychain
if command -v keychain >/dev/null; then
    if [ -z "$TMUX" ]; then
        # Run Command Normally if not inside of a tmux shell
        keychain ~/.ssh/id_ed25519
    else
        # Run quietly and quickly if running from inside tmux
        keychain --quick --quiet ~/.ssh/id_ed25519
    fi
    . ~/.keychain/${HOST}-sh
fi

# load the syntax highlighting plugin if it's installed
if [ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
