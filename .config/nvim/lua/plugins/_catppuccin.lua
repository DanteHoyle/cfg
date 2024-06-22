-- File: catppuccin.lua
-- Description: Load and enable catppuccin plugin from https://github.com/catppuccin/nvim?tab=readme-ov-file

return {
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

    opts = {
        no_italic = true,
    },
}
