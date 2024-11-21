-- File: colors.lua

return {
    { -- OneDark Colorscheme
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = 'VeryLazy',
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme catppuccin-frappe]]
        end,
    },
}
