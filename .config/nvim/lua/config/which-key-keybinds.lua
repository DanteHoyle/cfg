
-- maps Leader + Leader to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })
