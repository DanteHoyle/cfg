-- File: colors.lua

return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = true
    },
    {
        'scottmckendry/cyberdream.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme cyberdream]]
        end,
    }
}
