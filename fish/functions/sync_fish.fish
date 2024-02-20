# syncs fish config
function sync_fish
    echo syncing fish
    cp --recursive /home/dante/Dev/dotfiles/fish/* /home/dante/.config/fish 
end