-- File: hotkeys.lua

--- Hot Keys -------------------------------------------------------------------
-- remaps <Leader>
vim.g.mapleader = ";";

--- My Scripts ---
-- maps <F12> to toggle between tabs and spaces
vim.api.nvim_set_keymap("n", "<F12>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

--- WhichKey ---
-- maps <Leader> + <Leader> to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })

--- NvimTree ---
-- maps <Leader> + f to focus NvimTree
vim.api.nvim_set_keymap("n", "<Leader>f", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- maps <Leader> + f to toggle NvimTree
vim.api.nvim_set_keymap("n", "<Leader>T", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

--- Telescope ---
-- maps <Leader> + F to open telescope
vim.api.nvim_set_keymap("n", "<C-f>", ":Telescope<CR>", { noremap = true, silent = true })
