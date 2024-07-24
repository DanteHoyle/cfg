-- File: catppuccin.lua
-- Description: Load and enable catppuccin plugin from https://github.com/catppuccin/nvim?tab=readme-ov-file

return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = 'kanagawa',
    priority = 1000,
    config = function()
        require('kanagawa').setup {}
        vim.cmd.colorscheme "kanagawa-dragon"
    end,
}
