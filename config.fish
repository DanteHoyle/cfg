if status is-interactive
    tmux attach
    or tmux
end

function reload_fish
    source ~/.config/fish/config.fish
end
