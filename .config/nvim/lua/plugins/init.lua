-- File: init.lua

return {
    -- Automatically configures shiftwidth and Expandtab
    -- { 'tpope/vim-sleuth' },
    {
        {
            'windwp/nvim-autopairs',
            event = "InsertEnter",
            config = true
            -- use opts = {} for passing setup options
            -- this is equivalent to setup({}) function
        }
    },
    { -- Which-Key shows shortcuts on screen contextually
        "folke/which-key.nvim",
        event = 'VimEnter',
        dependencies = { "echasnovski/mini.icons" },
        opts = { preset = "modern" },
        keys = {
            { "<leader>?", function() require("which-key").show({ global = true }) end, desc = "Global Local Keymaps (which-key)", },
            { "<localleader>?", function() require("which-key").show({ global = false }) end, desc = "Buffer Local Keymaps (which-key)", },
        },
    },
    {
        -- Unified shortcut for moving between tmux and nvim
        "christoomey/vim-tmux-navigator",
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
    {
        "mbbill/undotree",

        config = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
        end
    },
}
