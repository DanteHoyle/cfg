# File: completion.zsh
zmodload zsh/complist
fpath=($XDC_CACHE_HOME/zsh $fpath)

autoload -U compinit; compinit -d "$XDG_CACHE_HOME/zsh/.zcompdump"
_comp_options+=(globdots)

setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD

# enable cache and set a path
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$XDG_CACHE_HOME/zsh/cache"

# enable completer and approximate completion
zstyle ':completion:*' completer _extensions _complete _approximate

# show descriptions for completion matches
zstyle ':completion:*' verbose yes

# highilght currently selected completion option
zstyle ':completion:*' menu select

# display what the completion represents
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'

# display correcitons if there is an ambigiuos typo
zstyle ':completion:*:*:*:*:corrections' format '%F{yellow}!- %d (errors: %e) -!%f'

# Autocomplete options for cd instead of directory stack
zstyle ':completion:*' complete-options true

# File sort by modification
zstyle ':completion:*' file-sort modification

# group entries with their group title
zstyle ':completion:*' group-name ''

# makes files have ls like colors
zstyle ':completion:*default' list-colors ${(s.:.)LS_COLORS}

# makes matches case insensitivbe
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
