# File: init.zsh

for conf in ~/.config/zsh/conf.d/*; do
    source $conf
done

# load zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# load zsh-autosuggestions for fish-like suggestions 
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
