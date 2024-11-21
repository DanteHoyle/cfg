-- File: init.lua

return {
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        opts = {}
    },
    { -- Which-Key shows shortcuts on screen contextually
        'folke/which-key.nvim',
        event = 'VeryLazy',
        dependencies = { 'echasnovski/mini.icons' },
        opts = { preset = 'modern' },
        keys = {
            { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)', },
        },
    },
    {
        -- Unified shortcut for moving between tmux and nvim
        'christoomey/vim-tmux-navigator',
        cmd = {
            'TmuxNavigateLeft',
            'TmuxNavigateDown',
            'TmuxNavigateUp',
            'TmuxNavigateRight',
            'TmuxNavigatePrevious',
        },
        keys = {
            { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate Left (TmuxNavigator)' },
            { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate Down (TmuxNavigator)' },
            { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate Up (TmuxNavigator)' },
            { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate Right (TmuxNavigator)' },
            { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate Previous (TmuxNavigator)' },
        },
    },
}
