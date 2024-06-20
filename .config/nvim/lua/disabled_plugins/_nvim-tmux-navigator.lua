-- File: nvim-tmux-navigation.lua
return { 
    "alexghergh/nvim-tmux-navigation",
    
    opts = {
        keybindings = {
            left = "<M-h>",
            right = "<M-l>",
            up = "<M-k>",
            down = "<M-j>",

            last_active = "<M-n>",
            next = "<M-p>"
        },
    },
}

