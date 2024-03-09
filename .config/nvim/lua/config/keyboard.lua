-- File: hotkeys.lua

--- Normal Mode Remaps ---
-- remaps <Leader>
vim.g.mapleader = ";";

-- maps F12 to clear highlighted matches
vim.api.nvim_set_keymap("n", "<F12>", ":noh<CR>", { noremap = true, silent = true })

-- maps F1 to run lua function which toggles between tabs and spaces
vim.api.nvim_set_keymap("n", "<F1>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

-- maps Ctrl + S to save the current file
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = false })
