return {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    run = ":Neorg sync-parsers",
    priority = 30,
    config = function()
        require("neorg").setup {
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {},
                ["core.keybinds"] = {
                    config = {
                        hook = function()
                            keybinds.map("norg", "n", "<LocalLeader>ni", "<cmd>Neorg inject-metadata<CR>")
                        end
                    }
                },
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            personal = "~/notes/personal",
                            work = "~/notes/work",
                            it = "~/notes/it",
                        },
                        index = "index.norg"
                    },
                },
                ["core.summary"] = {},
--------------- ["core.ui.calendar"] = {},
            },
        }
    end,
}
