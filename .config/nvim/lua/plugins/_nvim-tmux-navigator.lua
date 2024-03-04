-- File: nvim-tmux-navigation.lua
return { 
    "alexghergh/nvim-tmux-navigation",
    
    opts = {
        keybindings = {
            left = "<C-h>",
            right = "<C-l>",
            up = "<C-k>",
            down = "<C-j>",

            last_active = "<C-\\>",
            next = "<C-Space>",
        },
    },
}

