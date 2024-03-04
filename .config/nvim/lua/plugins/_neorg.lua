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
                ["core.dirman"] = {
                    config = {
                        workspaces = {
                            personal = "~/notes/personal",
                            work = "~/notes/work",
                            it = "~/notes/it",
                        },
                    },
                },
                ["core.ui.calendar"] = {},
            },
        }
    end,
}
