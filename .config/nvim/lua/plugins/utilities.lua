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
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- Rightclick Macros
    { "kvngvikram/rightclick-macros" },
    -- Auto Pairs
    { "jiangmiao/auto-pairs" }
}
