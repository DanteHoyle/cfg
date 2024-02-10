#!/usr/bin/env fish
# sync_source_to_live.fish

# this script pulls config files from the running config and stores it in the dotfiles directory
# use at your own risk - only tested on a fedora 39 workstation

set VIM_PATH ~/.vim


function sync_vim
    echo Syncing vimrc to $VIM_PATH
    if cp vimrc $VIM_PATH
        echo Success
    else
        echo Error! exiting script...\n
    end
end

function sync_all
    sync_vim
end

sync_all