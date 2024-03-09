-- File: telescope-keybinds.lua
-- maps <Leader> + P to open telescope
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope<CR>", { noremap = true, silent = true })
