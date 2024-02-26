return {
    --- UTILITY
    -- which-key shows visual of possible keystrokes and their actions
    {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function ()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	end,
    },

    -- nvim-tree
    {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
	    "nvim-tree/nvim-web-devicons",
	},
	config = function()
	    require("nvim-tree").setup {}
	end,
    },

    --- THEME
    -- Cappuccin Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
}
