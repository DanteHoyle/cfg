# File: abbreviations.fish
# Description: adds abbreviations which auto-expand in a fish prompt

if status is-interactive
    # common directory abbreviations
    abbr --add cnvim $NVIM_CONFIG_DIR
    abbr --add ctmux $TMUX_CONFIG_DIR
    abbr --add cfish $FISH_CONFIG_DIR
    abbr --add ckitty $KITTY_CONFIG_DIR
end
