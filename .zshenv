# File: .zshenv

# used by ZSH to find the rest of the rc files
export ZDOTDIR=$HOME/.config/zsh

# XDG paths
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_CACHE_HOME="$HOME/.cache"

# editor
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="most"

# man pager
export MANPAGER='nvim +Man!'
export MANWIDTH=999

if [ -z WSL_DISTRO_NAME ]; then

else 
    WSL_LIGHT_THEME=$(powershell.exe -Command "Get-ItemPropertyValue -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize -Name AppsUseLightTheme")
fi
