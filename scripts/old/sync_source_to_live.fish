#!/usr/bin/env fish
# sync_source_to_live.fish

# this script pulls config files from the running config and stores it in the dotfiles directory
# use at your own risk - only tested on a fedora 39 workstation

# these variables are used by the script to place config files
set VIM_PATH ~/.vim
set FISH_PATH $__fish_config_dir
set TMUX_PATH $HOME


function sync_vim
    echo Syncing vimrc to $VIM_PATH/vimrc

    # copies config file. Prints whether operation is successful and quits early if it fails
    if cp vimrc $VIM_PATH/vimrc
        echo Success.

    else
        echo Error! exiting script...\n
        exit 1

    end
end

function sync_fish
    echo Syncing config.fish to $FISH_PATH

    # copies config file. Prints whether operation is successful and quits early if it fails
    if cp config.fish $FISH_PATH/config.fish
        echo Success.

    else
        echo Error! exiting script... \n
        exit 1

    end
end

function sync_tmux
    echo Syncing tmux.conf to $TMUX_PATH/.tmux.conf 

    # copies config file. Prints whether operation is successful and quits early if it fails
    if cp tmux.conf $TMUX_PATH/.tmux.conf
        echo Success.
        
    else
        echo Error! exiting script... \n
        exit 1

    end
end

function sync_all
    sync_vim
    sync_fish
    sync_tmux

    echo All Done!

end

# If there are no arguments, just sync all files.
if not test $argv
    sync_all 
end

# Test to see if any programs were mentioned. argparse will autofail and quit 
# the program if an unrecognized argument is given
argparse 'v/vim' 't/tmux' 'f/fish' -- $argv
or return 

# Goes through all flags and runs corresponding function.
if test $_flag_vim
    sync_vim
end

if test $_flag_tmux
    sync_tmux
end

if test $_flag_fish
    echo Syncing all config files because no arguments were provided.
    sync_fish
end

echo Script finished successfully!