# File: config.fish
# Description: main configuration file for fish
# Documentation https://fishshell.com/docs/current/

if status is-interactive
    ### Abbreviations ### 
    # nvim
    if type --query nvim
        abbr --add vim nvim
        abbr --add view nvim -R
        abbr --add vimdiff nvim -D
    end

    # config is an abbreviation for working with the bare git repository for dotfiles 
    abbr --add config /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME

    # common dirs
    abbr nvimdir ~/.config/nvim
    abbr fishdir ~/.config/fish
    abbr tmuxdir ~/.config/tmux

    # environment variables
    set -gx EDITOR /usr/bin/nvim
end
