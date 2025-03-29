-- File: init.lua

return {
    { 'windwp/nvim-autopairs', event = "InsertEnter", config = true },
    { 'tpope/vim-surround' },
    -- Automatic Indentation Detection
    { 'tpope/vim-sleuth' },
    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
    { -- Which-Key shows shortcuts on screen contextually
        'folke/which-key.nvim',
        event = 'VeryLazy',
        dependencies = { 'echasnovski/mini.icons' },
        opts = { preset = 'modern' },
        keys = {
            { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)', },
        },
    },
    { -- Unified shortcut for moving between tmux and nvim
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
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },
        enabled = true,
        opts = {
            theme = 'catppucin'
        }
    },
}
