-- File: telescope.lua

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        config = function()
            local builtin = require('telescope.builtin')
            -- Telescope
            vim.keymap.set('n', '<leader><leader>', builtin.builtin, { desc = 'Telescope' })
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find Files (Telescope)' })
            vim.keymap.set('n', '<leader>d', builtin.lsp_definitions, { desc = 'LSP Definitions (Telescope)' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Vim Help (Telescope)' })
            vim.keymap.set('n', '<leader>s', builtin.git_status, { desc = 'Git Status (Telescope)' })
            vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers (Telescope)' })
            vim.keymap.set('n', '<leader>D', builtin.lsp_type_definitions, { desc = 'LSP Type Definitions (Telescope)' })
            vim.keymap.set('n', '<leader>g', builtin.live_grep , { desc = 'Live Grep Search (Telescope)' })
        end
    },
    {
        "debugloop/telescope-undo.nvim",
        dependencies = {
            {
                "nvim-telescope/telescope.nvim",
                dependencies = { "nvim-lua/plenary.nvim" },
            },
        },
        keys = {
            { -- lazy style key map
                "<leader>u",
                "<cmd>Telescope undo<cr>",
                desc = "undo history",
            },
        },
        opts = {},
        config = function(_, opts)
            require("telescope").setup(opts)
            require("telescope").load_extension("undo")
        end,
    },
}
