if status is-interactive
	# Aliases
	alias vim nvim
	# Used for tracking with bare git repo 
	alias config='/usr/bin/git --git-dir=$HOME/Repos/dotfiles/ --work-tree=$HOME'

	# Environment Variables
	set -gx EDITOR /usr/bin/nvim
end
