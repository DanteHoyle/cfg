-- File:	editor.lua
-- Description: Contains settings related to text editing 

-- Makes 1 tab press equal four space. When editing a file with tabs, hit <F12>
-- to manually switch between Tabs and Spaces. This runs a function in 
-- functions/toggle_lua.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Relative Line Numbering
vim.opt.number = true
vim.opt.numberwidth = 5

-- Clipboard settings
vim.opt.clipboard = "unnamedplus"

--- MISC ---
-- Rempaps leader to semicolon
vim.g.mapleader = " ";
vim.g.maplocalleader = ",";

-- Enables mouse support
vim.opt.mouse = "a"

--- KEYBINDS ---
-- Clear search highlight with Leader + h
vim.api.nvim_set_keymap("n", "<Leader>h", ":nohls<CR>", { noremap = true, silent = false })
-- Toggle line wrapping with Leader + w
vim.api.nvim_set_keymap("n", "<Leader>w", ":set wrap!<CR>", { noremap = true, silent = false })
