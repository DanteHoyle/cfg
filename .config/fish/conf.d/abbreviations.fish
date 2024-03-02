# File: abbreviations.fish
# Description: adds abbreviations which auto-expand in a fish prompt

if status is-interactive
    # nvim
    if type --query nvim
        abbr --add vim nvim
        abbr --add view nvim -R
        abbr --add vimdiff nvim -D
    end

    # config is an abbreviation for working with the bare git repository for dotfiles 
    abbr --add config /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME

    # workspaces
    abbr cnvim nvim ~/.config/nvim 
    abbr cfish nvim ~/.config/fish 
    abbr ctmux nvim ~/.config/tmux
    abbr cvim nvim ~/.vim 
    abbr ckitty nvim ~/.config/kitty 

    abbr notes nvim ~/notes

end
