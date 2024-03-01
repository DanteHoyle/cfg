return {
    "nvim-neorg/neorg",
    dependencies = { "nvim-lua/plenary.nvim" },
    build = ":Neorg sync-parsers",

    ft = "norg",                -- sets .norg filetype
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
                            notes = "~/notes",
                        },
                    },
                },
                ["core.ui.calendar"] = {},
            },
        }
    end,
}
