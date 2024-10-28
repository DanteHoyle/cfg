# File: .zshrc

# PROMPT SETTINGS
autoload -U colors && colors
PROMPT="%(?..%B(%?%)%b)%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$reset_color$fg[red]%}]%{$reset_color%}$%b "

# use traditional shell keybinds for the most part
bindkey -e

source "$HOME/.config/zsh/aliases.zsh"
# source secondary alias file not synced with git repo
if [ -e "$HOME/.aliases.zsh" ]; then
    source "$HOME/.aliases.zsh"
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

# Fish style autosuggestions
if [ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

# fg-bg toggle via c-z
function fg-bg {
    if [[ $#BUFFER -eq 0 ]]; then
        BUFFER=fg
        zle accept-line
    else
        zle push-input
    fi
}
zle -N fg-bg
bindkey '^z' f
