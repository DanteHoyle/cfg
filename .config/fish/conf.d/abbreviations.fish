# File: abbreviations.fish
# Description: adds abbreviations which auto-expand in a fish prompt

if status is-interactive
    # config is an abbreviation for working with the bare git repository for dotfiles 
    abbr --add config cfg
end
