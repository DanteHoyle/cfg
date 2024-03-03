return {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    run = ":Neorg sync-parsers",

    cmd = "Neorg",              -- Lazy-load on command
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
                    index = "home.norg",
                    default_workspace = "home"
                    },
                },
                ["core.ui.calendar"] = {},
            },
        }
    end,
}
