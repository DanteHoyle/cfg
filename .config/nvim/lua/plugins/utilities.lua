-- File: utilities.lua

return {
    -- Rainbow CSV
    {
        "mechatroner/rainbow_csv",
        version = "*",
        lazy = false,
    },
    -- Vim Telescope
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = {
            vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':Telescope<CR>', { noremap = true, silent = false }),
            vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = false }),
            vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = false }),
        },
    },
    -- Rightclick Macros
    { "kvngvikram/rightclick-macros" },
    -- Auto Pairs
    { "jiangmiao/auto-pairs" },
    {
        'mechatroner/rainbow_csv',
        version = '*',
        lazy = false,
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        theme = "onedark",
        opts = {},
    },
}
