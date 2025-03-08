-- File: telescope.lua

return {
    {
        'nvim-telescope/telescope.nvim', tag='0.1.8',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { -- If encountering errors, see telescope-fzf-native README for installation instructions
                'nvim-telescope/telescope-fzf-native.nvim',

                -- `build` is used to run some command when the plugin is installed/updated.
                -- This is only run then, not every time Neovim starts up.
                build = 'make',

                -- `cond` is a condition used to determine whether this plugin should be
                -- installed and loaded.
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
            { 'nvim-telescope/telescope-ui-select.nvim' },

            -- Useful for getting pretty icons, but requires a Nerd Font.
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },
        lazy = false,
        config = function()
            require('telescope').setup {
                extensions = {
                    ['ui-select'] = {
                        require('telescope.themes').get_dropdown(),
                    },
                },
            }
            -- Enable Telescope extensions if they are installed
            pcall(require('telescope').load_extension, 'fzf')
            pcall(require('telescope').load_extension, 'ui-select')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
            vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
            -- vim.keymap.set('n', '<leader><leader>', require('telescope.builtin').builtin, { desc = 'Telescope Buitin (Telescope)' } )
            -- vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, { desc = 'Find Files (Telescope)' } )
            -- vim.keymap.set('n', '<leader>d', require('telescope.builtin').lsp_definitions, {desc = 'LSP Definitions (Telescope)'} )
            -- vim.keymap.set('n', '<leader>vh', require('telescope.builtin').help_tags, {desc = 'Vim Help (Telescope)'})
            -- vim.keymap.set('n', '<leader>s', require('telescope.builtin').git_status, {desc = 'Git Status (Telescope)'} )
            -- vim.keymap.set('n', '<leader>w', require('telescope.builtin').buffers, {desc = 'Buffers (Telescope)'} )
            -- vim.keymap.set('n', '<leader>D', require('telescope.builtin').lsp_type_definitions, {desc = 'LSP Type Definitions (Telescope)'} )
            -- vim.keymap.set('n', '<leader>g', require('telescope.builtin').live_grep, {desc = 'Live Grep Search (Telescope)'})
        end,
    },
}
