-- File: colorschemes.lua
-- Description: Master File for loading colorscheme plugins using lazy.nvim

return {
    "navarasu/onedark.nvim",
    name = "onedark",
    lazy = false,
    priority = 1000,
    config = function()
        vim.cmd [[colorscheme onedark]]
    end,
};
