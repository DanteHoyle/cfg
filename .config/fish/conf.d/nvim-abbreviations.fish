# File: nvim_abbreviations.fish

if status is-interactive
    if type --query nvim
        abbr --add vim nvim
        abbr --add view nvim -R
        abbr --add vimdiff nvim -D
    end
end
