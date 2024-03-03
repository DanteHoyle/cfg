# File: cfg.fish
function cfg --wraps=/usr/bin/git --description "dotfiles wrapper for git"
    /usr/bin/git --git-dir=/home/dante/.cfg --work-tree=/home/dante $argv
end
