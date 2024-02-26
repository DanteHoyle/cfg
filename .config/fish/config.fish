# File: config.fish

if status is-interactive
    # aliases
    if type --query nvim
        alias vim /usr/bin/nvim
        alias vi /usr/bin/vim
    end

    # config is an abbreviation for working with the bare git repository for dotfiles 
    abbr --add config /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME

    # environment variables
    set -gx EDITOR /usr/bin/nvim
end
