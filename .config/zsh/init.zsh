# File: init.zsh# Change default editor

# checks if nvim is installed, if not sets vim as edtior
command -v nvim >/dev/null && EDITOR=nvim || EDITOR=vim

# Frequneytly used folders
VIM_CONFIG_DIR=~/.vim
NVIM_CONFIG_DIR=~/.config/nvim
FISH_CONFIG_DIR=~/.config/fish
KITTY_CONFIG_DIR=~/.config/kitty
TMUX_CONFIG_DIR=~/.config/tmux
ZSH_CONFIG_DIR=~/.config/zsh

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

for conf in ~/.config/zsh/conf.d/*; do
    source $conf
done

# load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load zsh-autosuggestions for fish-like suggestions 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
