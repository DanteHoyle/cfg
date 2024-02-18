#!/usr/bin/env fish
# sync_source_to_live.fish

# this script pulls config files from the running config and stores it in the dotfiles directory
# use at your own risk - only tested on a fedora 39 workstation

set VIM_PATH ~/.vim
set FISH_PATH $__fish_config_dir
set TMUX_PATH $HOME

function sync_vim
    echo Syncing vimrc to $VIM_PATH/vimrc
    if cp vimrc $VIM_PATH/vimrc
        echo Success
    else
        echo Error! exiting script...\n
        exit 1
    end
end

function sync_fish
    echo Syncing config.fish to $FISH_PATH
    if cp config.fish $FISH_PATH/config.fish
        echo Success
    else
        echo Error! exiting script... \n
        exit 1
    end

end

function sync_tmux
    echo Syncing tmux.conf to $TMUX_PATH/.tmux.conf 
    if cp tmux.conf $TMUX_PATH/.tmux.conf
        echo Success
    else
        echo Error! exiting script... \n
    end


end

function sync_all
    sync_vim
    sync_fish
    sync_tmux
    echo All Done!
end

sync_all