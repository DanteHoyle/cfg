-- init.lua

return {
    {
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme onedark]]
        end,
    },
    {
        "folke/which-key.nvim",
        lazy=false,
        dependencies = { "echasnovski/mini.icons" },
        opts = {
            preset = "helix"
        },
    },
    {
        "christoomey/vim-tmux-navigator",
        config = function()
            vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
            vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
            vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
            vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        theme = "onedark",
        config = true
    },
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        },
        opts = {
            sources = {
                'filesystem',
                'buffers',
                'git_status',
            },
            filesystem = {
                -- hijack_netrw_behavior = 'open_current',
                filtered_items = {
                    always_show = {
                        ".gitignore",
                    },
                    hide_gitignored = false,
                },
            },
        },
        config = function()
            -- Neotree
            vim.keymap.set('n', '<Leader>f', '<cmd>Neotree toggle left reveal_force_cwd<CR>')
            vim.keymap.set('n', '<Leader>b', '<cmd>Neotree toggle buffers right<CR>')
            vim.keymap.set('n', '<Leader>>', '<cmd>bnext<CR>')
            vim.keymap.set('n', '<Leader><', '<cmd>bprevious<CR>')
        end
    },
    { "HiPhish/rainbow-delimiters.nvim" },
}
