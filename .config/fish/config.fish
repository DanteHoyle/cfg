if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add cfg /usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME
end
