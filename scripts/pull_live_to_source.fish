#!/usr/bin/env fish
# sync_live_to_source.fish

if not test $argv
end

argparse 'v/vim' 't/tmux' 'f/fish' -- $argv
or return