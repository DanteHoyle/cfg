-- File: trouble.lua

return {
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
        keys = {
            { '<leader>tt', '<cmd>Trouble diagnostics toggle<cr>', desc = 'Trouble: Toggle Diagnostics' },
            { ']d', '<cmd>Trouble diagnostics next<cr>', desc = 'Trouble: Next Diagnostic (Trouble)' },
            { '[d', '<cmd>Trouble diagnostics prev<cr>', desc = 'Trouble: Previous Diagnostic' },
        },
    },
}
