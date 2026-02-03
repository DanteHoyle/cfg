export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"

if command -v fnm &> /dev/null; then
    eval "$(fnm env --use-on-cd --shell zsh)"
fi
