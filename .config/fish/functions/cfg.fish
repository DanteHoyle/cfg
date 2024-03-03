# File: cfg.fish
function cfg --wraps=git --description "dotfiles wrapper for git"
    git --git-dir=/home/dante/.cfg --work-tree=/home/dante $argv
end
