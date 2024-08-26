-- File: neorg.lua
-- Description: Configuration for Neovim plugin

return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        config = true,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd [[TSUpdate]]
        end,
    }
}
