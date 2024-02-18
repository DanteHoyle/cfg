if status is-interactive
    # Commands to run in interactive sessions can go here
    abbr --add cfgfish vim ~/.config/fish/config.fish
    abbr --add cfgvim vim ~/.vim/vimrc
    abbr --add cfgtmux vim ~/.tmux.conf

    if tmux has-session
        tmux attach
    else
        tmux
    end
end

function reload_fish
    source ~/.config/fish/config.fish
end

function update_system
    sudo apt update
    sudo apt upgrade
end
