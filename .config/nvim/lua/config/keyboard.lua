-- File: hotkeys.lua

-- MOUSE ---------------------------------------
-- Enable Mouse
vim.opt.mouse = 'a'

--- Hot Keys -------------------------------------------------------------------
-- remaps <Leader>
vim.g.mapleader = ";";

vim.api.nvim_set_keymap("n", "<F1>", ":noh<CR>", { noremap = true, silent = true })
--- My Scripts ---
-- maps F12 to toggle between tabs and spaces
vim.api.nvim_set_keymap("n", "<F12>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

--- WhichKey ---
-- maps 2x Leader to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })
--- NvimTree ---
-- maps Leader +  to focus NvimTree
vim.api.nvim_set_keymap("n", "<Leader><BS>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- maps Leader + Backspace to toggle NvimTree
vim.api.nvim_set_keymap("n", "<Leader><C-i>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

--- Telescope ---
-- maps <Leader> + P to open telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope<CR>", { noremap = true, silent = true })
