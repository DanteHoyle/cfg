if status is-interactive
	# aliases
	if type --query nvim
	    alias vim="nvim"
	    alias vi = "nvim"
	end

	# config is an abbreviation for working with the bare git repository for dotfiles 
	abbr config /usr/bin/git --git-dir=$HOME/.cfg --work-tree=$HOME

	# environment variables
	set -gx EDITOR /usr/bin/nvim
end
