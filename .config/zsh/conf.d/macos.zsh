if [ $(uname) = 'Darwin' ]; then
    eval "$(brew shellenv)"

    # source ZSH plugins
    source "${HOMEBREW_PREFIX}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
    source "${HOMEBREW_PREFIX}/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

    addtopath "$(brew --prefix coreutils)/libexec/gnubin"
fi
