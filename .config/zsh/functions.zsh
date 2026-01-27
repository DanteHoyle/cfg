# Create a new directory and CD into immediately
mkcd () {
    if [[ "$#" != 1 ]]; then
        echo "Usage: mkcd <new-path>"
        return 1
    fi
    mkdir -p "$1"
    cd "$1"
}

# Add a directory to the beginning of PATH if it is not already present
addtopath () {
    if [[ "$#" == 0 ]]; then
        echo "Usage: addpath <path>"
        return 1
    fi

    local abs_path="${1:A}"

    if [[ ":${PATH}:" == *":${abs_path}:"* ]]; then
        echo "'${abs_path}' is already in PATH"
        return 0
    fi

    export PATH="${abs_path}:${PATH}"
    echo "Added '${abs_path}' to PATH"
}

# Make a temporary directory and CD into it
tempd () {
    cd "$(mktemp -d)"
    chmod -R 0700 .
    if [[ $# -eq 1 ]]; then
        mkdir -p "$1";
        cd "$1"
    fi
}

# Open a temporary file with $EDITOR
tempf () {
    if [[ "$#" == 0 ]]; then
        local suffix=".md"
    else
        local suffix=".$1"
    fi
    "${EDITOR}" "$(mktemp --suffix=${ext})"
}

# Open a directory in $XDG_CONFIG_HOME (probably ~/.config/) with $EDITOR
cfge () {
    (cd "${XDG_CONFIG_HOME}/$1" && "${EDITOR}" .)
}

# Display the current git branch and dirty status for use in shell prompts
git_prompt_info() {
  local branch status_symbol=""
  branch=$(git symbolic-ref --short HEAD 2>/dev/null) || return

  if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
    status_symbol="*"
  fi

  if [[ "${branch}" == "main" || "${branch}" == "master" ]]; then
    echo " (%F{green}${branch}${status_symbol}%f)"
  else
    echo " (%F{yellow}${branch}${status_symbol}%f)"
  fi
}

# Lazy Load NVM and its completions on first use
lazy-nvm()
{
  unset -f nvm node npm npx
  export NVM_DIR="${XDG_CONFIG_HOME}/.nvm"
  [ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
  [ -s "${NVM_DIR}/bash_completion" ] && \. "${NVM_DIR}/bash_completion"  # This loads nvm bash_completion
}

nvm()
{
  lazy-nvm
  nvm $@
}

node()
{
  lazy-nvm
  node $@
}

npm()
{
  lazy-nvm
  npm $@
}

npx()
{
  lazy-nvm
  npx $@
}
