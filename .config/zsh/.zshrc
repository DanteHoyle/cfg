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
export HISTFILE="$HOME/.cache/zsh/zshhistory"
export HISTSIZE=5000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.
# END HISTORY
#
autoload -U compinit
compinit
_comp_options+=(globdots)
zstyle ':completion:*' menu select=2
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

# edit line in vim with alt-e:
autoload edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line

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

# Create and source local (untracked) zshrc and alias files
if [ ! -f ${XDG_CONFIG_HOME}/zsh/.aliases.local ]; then
    touch ${XDG_CONFIG_HOME}/zsh/.aliases.local
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > ${XDG_CONFIG_HOME}/zsh/.aliases.local
fi
if [ ! -f ${XDG_CONFIG_HOME}/zsh/.zshrc.local ]; then
    touch ${XDG_CONFIG_HOME}/zsh/.zshrc.local
    echo "# This is a local aliases file that is not not tracked by the cfg git repository" > ${XDG_CONFIG_HOME}/zsh/.zshrc.local
fi
source ${XDG_CONFIG_HOME}/zsh/.aliases
source ${XDG_CONFIG_HOME}/zsh/.aliases.local
source ${XDG_CONFIG_HOME}/zsh/.zshrc.local
