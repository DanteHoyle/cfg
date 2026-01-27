alias ..="cd .."

# alias ipy="ipython3"
# this starts ipython in a virtual env if one is active
alias ipy="python3 -c 'import IPython;IPython.terminal.ipapp.launch_new_instance()'"

# ls aliases
alias l="ls -C --classify --hyperlink=auto"
alias ls="ls --color=auto"
alias ll="ls --color=auto --almost-all -l --classify"
alias lt="ls --color=auto -AlFt"

alias info="info --vi-keys"

# tmux Alias
alias tma="tmux attach || tmux"
alias tmk="tmux kill-server"

# neovim Aliases
alias vi="$EDITOR"
alias vim="$EDITOR"
if [ "$EDITOR" = nvim ]; then
    alias vimdiff='nvim -d'
fi

# alias for working with bare git repo
alias cfg="git --git-dir=${HOME}/.cfg --work-tree=$HOME"

# jq aliases
alias jq-structure="jq -r '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"
alias jq-example="jq 'walk(if type == \"array\" then (if length > 0 then [.[0]] else . end) else . end)'"

# fping aliases
alias fping-host-check="fping --quiet --alive --stats --generate"

alias cfgz="cfge zsh"
alias cfgn="cfge nvim"
alias cfgt="cfge tmux"
alias cfgg="cfge ghostty"
