alias ..="cd .."

alias ipy="ipython3"

# ls aliases
alias l="ls -C --classify --hyperlink=auto"
alias ls="ls --color=auto"
alias ll="ls --color=auto --almost-all -l --classify"
alias lt="ls --color=auto -AlFt"

# tmux Alias
alias tma="tmux attach || tmux"
alias tmk="tmux kill-server"

# neovim Aliases
alias vi="$EDITOR"
alias vim="$EDITOR"
if [[ "$EDITOR" == nvim ]]; then
    alias vimdiff='nvim -d'
fi

# alias for working with bare git repo
alias cfg="git --git-dir=${HOME}/.cfg --work-tree=$HOME"

# aliases for editing config files
alias cfgz="pushd ${XDG_CONFIG_HOME}/zsh && $EDITOR . && popd"
alias cfga="pushd ${XDG_CONFIG_HOME}/zsh/ && $EDITOR aliases.zsh && popd"
alias cfgn="pushd ${XDG_CONFIG_HOME}/nvim && $EDITOR . && popd"
alias cfgk="pushd ${XDG_CONFIG_HOME}/kitty && $EDITOR . && popd"

# jq aliases
alias jq-structure="jq -r '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"
alias jq-example="jq 'walk(if type == \"array\" then (if length > 0 then [.[0]] else . end) else . end)'"

# fping aliases
alias fping-host-check="fping --quiet --alive --stats --generate"

mkcd () {
    mkdir -p "$1"
    cd "$1"
}

tempd () {
    cd "$(mktemp -d)"
    chmod -R 0700 .
    if [[ $# -eq 1 ]]; then
        mkdir -p "$1";
        cd "$1"
        chmod -R 0700 .
    fi
}

tempf () {
    if [[ "$#" == 0 ]]; then
        ext=".md"
    else
        ext="$1"
    fi
    $EDITOR "$(mktemp --suffix=$ext)"
}
