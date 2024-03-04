
-- maps Leader + Backspace to toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-i><C-i>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = false })
