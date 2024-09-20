-- File: ui.lua
-- This holds configuration for plugins related to Neovims UI

return {
    -- One Dark
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme onedark]]
        end,
    },
    -- Vim Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        theme = "onedark",
        opts = {},
    },
    -- Neotree
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        opts = {
            filesystem = {
                hijack_netrw_behavior = 'open_current',
                filtered_items = {
                    always_show = {
                        ".gitignore",
                    },
                    hide_gitignored = false,
                },
            },
            window = {
                mappings = {
                    ["<C-b>"] = "none",
                },
            },
        },
    },
    -- Which-Key
    {
        "folke/which-key.nvim",
        dependencies = { "echasnovski/mini.icons" },
        event = "VeryLazy",
        opts = {
            preset = "modern"
        },
        keys = {
            {
                "<leader>/",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
}
