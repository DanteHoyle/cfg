-- File: trouble.lua
return {
    'folke/trouble.nvim',
    lazy = 'LspEnter',
    keys = {
        {
            '<leader>tt',
            '<cmd>Trouble diagnostics toggle focus = true follow=true<cr>',
            desc='Diagnostics (Trouble)'
        },
        {
            '<leader>ts',
            '<cmd>Trouble symbols toggle<cr>',
            desc='Symbols (Trouble)'
        },
        {
            '<leader>tl',
            -- '<cmd>Trouble lsp win = {type=float, relative=editor, position=right, size={width=0.3, height=0.3}, title=LSP, title_pos=center}<CR>',
            '<cmd>Trouble mylsp<CR>',
            desc='LSP (Trouble)'
        },
    },
    opts = {
        warn_no_results = false,
        -- open_no_results = true,
        keys = {
            ['<CR>'] = 'jump_close',
        },
        modes = {
            mylsp = {
                mode = 'lsp',
                auto_close = true,
                focus = true,
                win = {
                    -- type = 'float',
                    type = 'split',
                    relative = 'editor',
                    border = 'rounded',
                    title = 'LSP',
                    title_pos = 'center',
                    position = 'left',
                    -- position = { 0, 0.5 },
                    size = 0.35,
                    -- zindex = 200,
                },
            },
        },
    },
}
