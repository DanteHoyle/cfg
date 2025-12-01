autoload -U colors && colors

# use traditional shell keybinds for the most part
bindkey -e

# Program Paths
export PATH="$HOME/bin:$HOME/.local/bin:$HOME/.cargo/bin:$PATH"

# Editor
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

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
PROMPT='%B%{$fg[green]%}%n@%{$fg[green]%}%m %{$fg[blue]%}%1~%{$fg[yellow]%}$(git_prompt)%{$reset_color%} %(?.$.%{$fg[red]%}$)%b '

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
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# edit CLI in vim with Ctrl + e:
autoload edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

# Load other config files

local_aliases="$XDG_CONFIG_HOME/zsh/aliases_local.zsh"
local_zshrc="$XDG_CONFIG_HOME/zsh/zshrc_local.zsh"

# Create and source local (untracked) zshrc and alias files
if [ ! -f  "$local_aliases" ]; then
    touch "$local_aliases"
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > $local_aliases
fi
if [ ! -f "$local_zshrc" ]; then
    touch "$local_zshrc"
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > "$local_zshrc"
fi

os=$(uname)

if [[ "$os" == 'Darwin' ]]; then
    source "$XDG_CONFIG_HOME/zsh/macos.zsh"
else
    source "$XDG_CONFIG_HOME/zsh/linux.zsh"
fi

source "$XDG_CONFIG_HOME/zsh/aliases.zsh"
source "$local_aliases"
source "$local_zshrc"
