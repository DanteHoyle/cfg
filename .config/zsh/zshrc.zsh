source "${XDG_CONFIG_HOME}/zsh/functions.zsh"

autoload -U colors && colors

setopt AUTOCD
setopt PROMPT_SUBST
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_SPACE

# use traditional shell keybinds for the most part
bindkey -e

# prompt settings
PROMPT='%F{green}%~%f$(git_prompt_info) %(!.#.%%) '

export HISTFILE="${HOME}/.zsh_history"
export HISTSIZE=5000000
export SAVEHIST="${HISTSIZE}"

# allow pasting URLs and multi line commands
autoload -Uz bracketed-paste-magic url-quote-magic
zle -N bracketed-paste bracketed-paste-magic
zle -N self-insert url-quote-magic

# edit CLI in vim with alt + e:
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line

# program paths
addtopath "${HOME}/bin" > /dev/null
addtopath "${HOME}/.local/bin" > /dev/null
addtopath "${HOME}/.cargo/bin" > /dev/null

# add programs installed from go to path
if command -v go &> /dev/null; then
    addtopath "$(go env GOPATH)/bin" > /dev/null
fi

# Auto Completion for Commands

# fzf tab complete
if command -v fzf &> /dev/null; then
    source <(fzf --zsh)
fi

# Main Compt Init Settings
source "${HOME}/.config/zsh/completions.zsh"

# uv shell completion
if command -v uv &> /dev/null; then
    eval "$(uv generate-shell-completion zsh)"
fi

# fnm shell completoins
if command -v fnm &> /dev/null; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi

# source local (untracked) file
local_zsh_config="${XDG_CONFIG_HOME}/zsh/local.zsh"
[ -f "${XDG_CONFIG_HOME}/zsh/local.zsh" ] && source "${XDG_CONFIG_HOME}/zsh/local.zsh"

os=$(uname)
if [ "${os}" = 'Darwin' ]; then
    eval "$(brew shellenv)"

    # source ZSH plugins
    source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

    addtopath "$(brew --prefix coreutils)/libexec/gnubin"
else
    # load the syntax highlighting plugin if it's installed
    if [ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
        source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    elif [ -e /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh ]; then
        source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
    fi

    # fish style autosuggestions
    if [ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    elif [ -e /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
        source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
        ZSH_AUTOSUGGEST_STRATEGY=(history completion)
    fi

    # fd alias
    alias fd=fdfind
fi

source "${XDG_CONFIG_HOME}/zsh/aliases.zsh"

