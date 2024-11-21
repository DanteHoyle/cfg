-- File: telescope.lua

return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'nvim-telescope/telescope-fzf-native.nvim',
        },
        opts = {},
        keys = {
            { '<leader><leader>', require('telescope.builtin').builtin, desc = 'Telescope Buitin (Telescope)' },
            { '<leader>ff', require('telescope.builtin').find_files, desc = 'Find Files (Telescope)' },
            { '<leader>d', require('telescope.builtin').lsp_definitions, desc = 'LSP Definitions (Telescope)' },
            { '<leader>vh', require('telescope.builtin').help_tags, desc = 'Vim Help (Telescope)' },
            { '<leader>s', require('telescope.builtin').git_status, desc = 'Git Status (Telescope)' },
            { '<leader>b', require('telescope.builtin').buffers, desc = 'Buffers (Telescope)' },
            { '<leader>D', require('telescope.builtin').lsp_type_definitions, desc = 'LSP Type Definitions (Telescope)' },
            { '<leader>g', require('telescope.builtin').live_grep, desc = 'Live Grep Search (Telescope)' },
        },
    },
    {
        'debugloop/telescope-undo.nvim',
        dependencies = {
            {
                'nvim-telescope/telescope.nvim',
                dependencies = { 'nvim-lua/plenary.nvim' },
            },
        },
        keys = {
            { -- lazy style key map
                '<leader>u',
                '<cmd>Telescope undo<cr>',
                desc = 'undo history',
            },
        },
        opts = {},
        config = function(_, opts)
            require('telescope').setup(opts)
            require('telescope').load_extension('undo')
        end,
    },
    {
        'nvim-orgmode/telescope-orgmode.nvim',
        event = 'VeryLazy',
        dependencies = {
            'nvim-orgmode/orgmode',
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            { '<leader>r', function() require('telescope').extensions.orgmode.refile_heading() end, desc = 'Refile Org Heading (Telescope Orgmode)', ft ='org' },
            { '<leader>fh', function() require('telescope').extensions.orgmode.search_headings() end, desc = 'Search Org Heading (Telescope Orgmode)', ft = 'org' },
            { '<leader>li', function() require('telescope').extensions.orgmode.insert_link() end, desc = 'Insert Link (Telescope Orgmode)' }, ft = 'org',
        },
        config = function()
            require('telescope').load_extension('orgmode')
        end,
    },
}
