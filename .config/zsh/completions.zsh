### --- Core init (faster, safer) ---
# Cache compinit work so startup is snappy; skip insecure-dir prompts (-i)
autoload -Uz compinit
compinit -i -d ~/.zcompdump

# Load fancy listing/menus
zmodload zsh/complist

# Show dotfiles in completion matches (like your _comp_options line)
_comp_options+=(globdots)

### --- General UX improvements ---
# Menu selection after 2 tabs; arrow keys to navigate
zstyle ':completion:*' menu select=2
bindkey -M menuselect '^M' .accept-line
bindkey -M menuselect '^G' .send-break
bindkey -M menuselect 'h'   .backward-char
bindkey -M menuselect 'j'   .down-line-or-history
bindkey -M menuselect 'k'   .up-line-or-history
bindkey -M menuselect 'l'   .forward-char

# Rich descriptions + tidy grouping
zstyle ':completion:*' verbose yes
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%B%F{blue}→ %d%f%b'
zstyle ':completion:*' description 'specify: %d'

# Colorize completion lists using your LS_COLORS (remove the duplicate blank line you had)
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Make file completion nicer
zstyle ':completion:*' list-dirs-first yes
zstyle ':completion:*' special-dirs false         # hide '.' and '..'
zstyle ':completion:*' accept-exact-dirs true
zstyle ':completion:*' file-sort modification     # newest first in file lists
zstyle ':completion:*' squeeze-slashes true       # // -> /

# Smarter matching: case-insensitive, then smart-case and fuzzy on punctuation/segments
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Z}' \
  'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=** r:|=** l:|=**'  # match across ., _, - and segments

# Prefer real completion, then correction/fuzzy as a fallback (approximate is expensive)
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' max-errors 2 numeric       # gentle correction

# Always draw a prompt in long lists
zstyle ':completion:*' list-prompt \
  '%SAt %p: TAB for more, or type a character to insert%s'
zstyle ':completion:*' select-prompt \
  '%SScrolling: current selection at %p%s'

# Don’t use legacy compctl
zstyle ':completion:*' use-compctl false

### --- Performance: cache results of slow completers ---
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh/completion
mkdir -p ~/.cache/zsh/completion

### --- Command-specific polish ---
# Make `kill` completion show processes with command lines
zstyle ':completion:*:*:kill:*' command \
  'ps -u $USER -o pid,user,tty,stat,time,cmd -w -w'

# Git: don’t sort branches alphabetically; show recent first
zstyle ':completion:*:git-checkout:*' sort false
zstyle ':completion:*:git-(checkout|switch):*' tag-order \
  'heads:local branches' 'remotes:remote branches' 'tags:tags'

# SSH/scp/sftp/rsync: pull hosts fr
