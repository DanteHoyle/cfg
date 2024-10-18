-- File: colors.lua

return {
    { -- OneDark Colorscheme
        "navarasu/onedark.nvim",
        name = "onedark",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd [[colorscheme onedark]]
        end,
    },
    -- Give parenthesis and brackets colors based on depth
    { "HiPhish/rainbow-delimiters.nvim" },
}
