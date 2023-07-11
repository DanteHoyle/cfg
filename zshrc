# intended to be used with oh-my-zsh

# plugins can be installed at ~/.oh-my-zsh/custom/plugins 
# zsh-autosuggestions - https://github.com/zsh-users/zsh-autosuggestions
# zsh-syntax-highlighting - https://github.com/zsh-users/zsh-syntax-highlighting.git 

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# User configuration

export LANG=en_US.UTF-8
export EDITOR='vim'
export ARCHFLAGS="-arch x86_64"

alias ll="ls -al"
