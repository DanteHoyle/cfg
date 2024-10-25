-- File: trouble.lua
return {
    'folke/trouble.nvim',
    opts = {
        modes = {
            symbols = {
                win = {
                    type = 'split',
                    relative = 'win',
                    position = 'top',
                    size = 0.5, -- percent
                }
            },

            lsp = {
                type = 'split',
                relative = 'win',
                position = 'right',
                size = 0.3, -- percent
            },

            preview_float = {
                mode = 'diagnostics',
                preview = {
                    type = "float",
                    relative = "editor",
                    border = "rounded",
                    title = "Preview",
                    title_pos = "center",
                    position = { 0, -2 },
                    size = { width = 0.3, height = 0.3 },
                    zindex = 200,
                }

            },
        }
    },
    lazy = false,
    cmd = 'Trouble',
    keys = {
        {
            '<leader>tt',
            '<cmd>Trouble diagnostics toggle follow=true<cr>',
            desc='Diagnostics (Trouble)'
        },
        {
            '<leader>ts',
            '<cmd>Trouble symbols toggle focus=true<cr>',
            desc='Symbols (Trouble)'
        },
        {
            '<leader>tl',
            '<cmd>Trouble lsp toggle focus=true<cr>',
            desc='LSP (Trouble)'
        },
    }
}
