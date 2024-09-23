-- File: neorg.lua
-- Description: Configuration for Neovim plugin

return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup {
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {},
                    ["core.summary"] = {},
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.esupports.metagen"] = {
                        config = {
                            author = "Dante Hoyle",
                            type = "auto",
                        }
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp"
                        }
                    },
            },
        }

            vim.wo.foldlevel = 99
            vim.wo.conceallevel = 2
        end
    },
}
