alias ..="cd .."
alias notes="nvim ${HOME}/notes.md"
alias chars="nvim ${HOME}/.local/share/characters.txt"
alias pysrc="source .venv/bin/activate"
alias ipy="ipython3"
alias py="python3"

# ls aliases
alias l="ls -CF"
alias ls="ls --color=auto"
alias ll="ls --color=auto -AlF"
alias lt="ls --color=auto -AlFt"

# tmux Alias
alias tma="tmux attach || tmux"
alias tmk="tmux kill-server"

# neovim Aliases
alias vi="nvim"
alias vim="nvim"
alias vimdiff='nvim -d'

# aliases for editing config files
alias cfg="git --git-dir=${HOME}/.cfg --work-tree=$HOME"
alias cfgz="cd ${XDG_CONFIG_HOME}/zsh && ${EDITOR} zshrc.zsh"
alias cfgn="cd ${XDG_CONFIG_HOME}/nvim && ${EDITOR} init.lua"
alias cfga="cd ${XDG_CONFIG_HOME}/zsh && ${EDITOR} aliases.zsh"

# jq aliases
alias jq-structure="jq -r '[path(..)|map(if type==\"number\" then \"[]\" else tostring end)|join(\".\")|split(\".[]\")|join(\"[]\")]|unique|map(\".\"+.)|.[]'"
alias jq-example="jq 'walk(if type == \"array\" then (if length > 0 then [.[0]] else . end) else . end)'"
