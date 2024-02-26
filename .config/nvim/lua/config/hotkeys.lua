-- FILE:    hotkeys.lua
-- FOLDER:  nvim/lua/config 

-- Hot Keys -------------------------------------------------------------------
--- Hotkeys Loaded before plugins loaded 
vim.api.nvim_set_keymap('n', '<Space><Space>', ':WhichKey<CR>', { noremap = true, silent = true })
--- Remaps Leader Key
vim.g.mapleader = ";";
