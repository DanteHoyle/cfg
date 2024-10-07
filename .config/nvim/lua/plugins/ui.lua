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
    -- Tmux Navigator
    {
        "christoomey/vim-tmux-navigator",
        lazy=false,
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
    },
    -- Vim Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<Leader><Leader>', '<cmd>Telescope<CR>' },
            -- { '<C-B>', '<cmd>Telescope buffers<CR>' },
            { '<C-p>', '<cmd>Telescope find_files<CR>' },
            { '<Leader>s', '<cmd>Telescope lsp_document_symbols<CR>' },
            { '<Leader>S', '<cmd>Telescope lsp_dynamic_workspace_symbols<CR>' }
        }
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        lazy=false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        theme = "onedark",
        opts = {},
    },
    -- Neotree
    {
        'nvim-neo-tree/neo-tree.nvim',
        lazy=false,
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        keys = {
            { '<Leader>f', '<cmd>Neotree toggle<CR>' },
        },
        opts = {
            enable_diagnostics = true,
            sources = {
                'filesystem',
                'buffers',
                'git_status',
                'document_symbols',
            },
            source_selector = {
                winbar = true,
                statusline = true,
            },
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
        lazy=false,
        dependencies = { "echasnovski/mini.icons" },
        event = "VeryLazy",
        opts = {
            preset = "helix"
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
