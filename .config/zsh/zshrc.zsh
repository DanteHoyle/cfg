autoload -U colors && colors

# use traditional shell keybinds for the most part
bindkey -e

# PROMPT SETTINGS
git_prompt() {
    local branch="$(git symbolic-ref HEAD 2> /dev/null | cut -d'/' -f3-)"
    local branch_truncated="${branch:0:30}"
    if (( ${#branch} > ${#branch_truncated} )); then
        branch="${branch_truncated}..."
    fi

    [ -n "${branch}" ] && echo " (${branch})"
}
setopt PROMPT_SUBST
PROMPT='%B%{$fg[green]%}%n@%{$fg[green]%}%M %{$fg[blue]%}%~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '

# HISTORY
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
# Updates the history file after every command is executed
setopt INC_APPEND_HISTORY
# Share history between all sessions.
setopt SHARE_HISTORY
# Write the history file in the ':start:elapsed;command' format.
setopt EXTENDED_HISTORY
# Do not record an event starting with a space.
setopt HIST_IGNORE_SPACE         

# SHELL AUTO COMPLETE
source "$HOME/.config/zsh/completions.zsh"

# edit CLI in vim with Ctrl + e:
autoload edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

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
elif [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
fi

# Fish style autosuggestions
if [ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
elif [ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
    ZSH_AUTOSUGGEST_STRATEGY=(history completion)
fi

local_aliases="${XDG_CONFIG_HOME}/zsh/aliases_local.zsh"
local_zshrc="${XDG_CONFIG_HOME}/zsh/zshrc_local.zsh"

# Create and source local (untracked) zshrc and alias files
if [ ! -f  "$local_aliases" ]; then
    touch "$local_aliases"
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > $local_aliases
fi
if [ ! -f "$local_zshrc" ]; then
    touch "$local_zshrc"
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > "$local_zshrc"
fi

source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"
source "$local_aliases"
source "$local_zshrc"
