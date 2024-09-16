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
    },
    -- Lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        theme = "onedark",
        opts = {},
    },
    -- Autopairs
    { "jiangmiao/auto-pairs" },

    { "dhruvasagar/vim-table-mode" }
}
