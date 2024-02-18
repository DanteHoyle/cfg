if status is-interactive
    if not $tmux
        tmux attach
        or tmux
    end
end

function reload_fish
    source ~/.config/fish/config.fish
end
