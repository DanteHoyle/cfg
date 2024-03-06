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

# attemps to load arch path, followed by debian / fedora path if that fails
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh || \
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh || \
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh 
