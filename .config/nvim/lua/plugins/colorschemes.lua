-- File: colorschemes.lua
-- Description: Master File for loading colorscheme plugins using lazy.nvim

return {
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                no_italic = true,
            }
            vim.cmd.colorscheme "catppuccin"
        end,
        enabled=true
    },
    {
        "miikanissi/modus-themes.nvim",
        lazy = false,
        priority = 1000,
        enabled=true
    },
};
