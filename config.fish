if status is-interactive
    # joins existing tmux session if one exists, creates a new one otherwise
    if tmux has-session
        tmux attach
    else
        tmux
    end
end

function reload_fish
    source ~/.config/fish/config.fish
end
