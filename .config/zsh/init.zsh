# File: init.zsh# Change default editor

# checks if nvim is installed, if not sets vim as edtior
command -v nvim >/dev/null && EDITOR=nvim || EDITOR=vim

# Frequneytly used folders
VIM_CONFIG_DIR="$HOME/.vim"
NVIM_CONFIG_DIR="$HOME~/.config/nvim"
FISH_CONFIG_DIR="$HOME/.config/fish"
KITTY_CONFIG_DIR="$HOME/.config/kitty"
TMUX_CONFIG_DIR="$HOME/.config/tmux"
ZSH_CONFIG_DIR="$HOME/.config/zsh"

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="~/.cache/zsh/history"

# Include alias file
source "$ZSH_CONFIG_DIR/conf.d/aliases.zsh"
# Setup prompt
source "$ZSH_CONFIG_DIR/conf.d/prompt.zsh"

# Add to path
path+=("$HOME/.local/bin")

# attemps to load arch path, followed by debian / fedora path if that fails
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null || \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null || \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 2> /dev/null

source "$ZSH_CONFIG_DIR/conf.d/vim.zsh"

