-- File: keybinds.lua
-- Description: This is where I remap keybinds

--- MISC ---
-- Rempaps leader to semicolon
vim.g.mapleader = ";";

-- Enables mouse support
vim.opt.mouse = 'a'

---  ---

-- maps F12 to clear highlighted matches
vim.api.nvim_set_keymap("n", "<F12>", ":noh<CR>", { noremap = true, silent = true })

-- maps F1 to run lua function which toggles between tabs and spaces
vim.api.nvim_set_keymap("n", "<F1>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })

-- maps Ctrl + S to save the current file
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true, silent = false })

-- maps <Leader> + n to open Neorg workspaces
vim.api.nvim_set_keymap("n", "<Leader>n", ":Neorg ", { noremap = true, silent = false })

-- maps Leader + Backspace to toggle NvimTree
vim.api.nvim_set_keymap("n", "<C-i><C-i>", ":NvimTreeFindFileToggle<CR>", { noremap = true, silent = false })
-- maps <Leader> + P to open telescope
vim.api.nvim_set_keymap("n", "<Leader>p", ":Telescope<CR>", { noremap = true, silent = true })

-- maps Leader + Leader to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })
