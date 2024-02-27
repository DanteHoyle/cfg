-- File catppuccin.lua

return { 
    "catppuccin/nvim", 
    name = "catppuccin", 
    -- settings lazy and priority here makes sure this loads immediately
    lazy = false, 
    priority = 1000,

    config = function()
        -- loads the theme here
        require("catppuccin").setup()
        vim.cmd([[colorscheme catppuccin-mocha]])
    end,
}
