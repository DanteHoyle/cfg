-- File: colorschemes.lua
-- Description: Master File for loading colorscheme plugins using lazy.nvim

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup {
                no_italic = true,
            }
        end,
        enabled=false
    },
    {
        "miikanissi/modus-themes.nvim",
        name = "modus",
        lazy = false,
        priority = 1000,
        enabled=false
    },
    {
        "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false,
        priority = 1000,
        enabled=false
    },
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme onedark]]
        end,
    },
};
