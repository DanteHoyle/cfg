-- File: keybinds.lua
-- Description: This is where I remap keybinds

--- MISC ---
-- Rempaps leader to semicolon
vim.g.mapleader = " ";
vim.g.maplocalleader = ",";

-- Enables mouse support
vim.opt.mouse = 'v'

-- 
vim.api.nvim_set_keymap("n", "<F12>", ":noh<CR>", { noremap = true, silent = true })
-- maps F1 to run lua function which toggles between tabs and spaces
vim.api.nvim_set_keymap("n", "<F1>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<Leader>y", ":'<,'>w !clip.exe<CR><CR>", { noremap = true, silent = true })
