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

            local map = function(keys, func, desc, mode)
                mode = mode or 'n'
                vim.keymap.set(mode, keys, func, { desc = 'Telescope: ' .. desc })
            end

            map('<leader>ff', builtin.find_files, '[F]ind [F]iles')
            map('<leader>fg', builtin.live_grep, '[F]ind w/ [G]rep')
            map('<leader>fb', builtin.buffers, '[F]ind [B]uffers')
            map('<leader>fh', builtin.help_tags, 'Vim [H]elp [T]ags')
            map('<leader>fd', builtin.lsp_definitions, 'LSP [D]efinitions' )
            map('<leader>f<leader>', builtin.builtin, 'Default Menu')
        end,
    },
}
