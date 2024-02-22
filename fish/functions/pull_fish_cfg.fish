# syncs fish config from git source
function pull_fish_cfg --description 'Copies config from git repo to running fish config'
    # cp --recursive /home/dante/Dev/dotfiles/fish/* /home/dante/.config/fish 
    set --local options 'c/clean' 'h/help'
    set --local install_path $__fish_config_dir
    argparse --name pull_fish_cfg $options -- $argv
    or return

    if set --query _flag_clean
        echo Are you sure?
        # Work In Progress
    end
end