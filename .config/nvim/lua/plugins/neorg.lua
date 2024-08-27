-- File: neorg.lua
-- Description: Configuration for Neovim plugin

return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        opts = {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.qol.toc"] = {},
                ["core.ui.calendar"] = {},
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            notes = "~/notes",
                        },
                    },
                },
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            vim.cmd [[TSUpdate]]
        end,
    }
}
