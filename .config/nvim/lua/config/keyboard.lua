-- File: hotkeys.lua

--- Mouse ---
-- Enable Mouse
vim.opt.mouse = 'a'

--- Normal Mode Remaps ---
-- remaps <Leader>
vim.g.mapleader = ";";

-- maps F12 to clear highlighted matches
vim.api.nvim_set_keymap("n", "<F12>", ":noh<CR>", { noremap = true, silent = true })

-- maps F1 to run lua function which toggles between tabs and spaces
vim.api.nvim_set_keymap("n", "<F1>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

-- maps Ctrl + S to save the current file
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = false })

-- maps Leader + n to enter commandline mode with prefix :Neorg
vim.api.nvim_set_keymap("n", "<F12>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

--- Insert Mode Remaps ---
-- Leader + b for bold in Neorg
vim.api.nvim_set_keymap("i", "<Leader>b", "**<Esc>i", { noremap = true, silent = true })

-- Leader + i for italic in Neorg 
vim.api.nvim_set_keymap("i", "<Leader>i", "//<Esc>i", { noremap = true, silent = true })

-- Leader + u for underline in Neorg
vim.api.nvim_set_keymap("i", "<Leader>u", "__<Esc>i", { noremap = true, silent = true })

--- Begin Plugin Config ---

--- WhichKey ---
-- maps Leader + Leader to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })

--- NvimTree ---
-- maps Leader + Backspace to toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-i><C-i>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = false })

--- Telescope ---
-- maps <Leader> + P to open telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope<CR>", { noremap = true, silent = true })
--- End Plugin Config ---
