-- File: nvim-tree.lua

return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
	    "nvim-tree/nvim-web-devicons",
    },
    opts = {
        vim.api.nvim_set_keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    },
}
