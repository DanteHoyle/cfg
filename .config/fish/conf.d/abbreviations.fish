# File: abbreviations.fish
# Description: adds abbreviations which auto-expand in a fish prompt

if status is-interactive
    # common directory abbreviations
    abbr --add cnvim ~/.config/nvim
    abbr --add ctmux ~/.config/tmux
    abbr --add cfish ~/.config/fish
    abbr --add ckitty ~/.config/kitty
end
