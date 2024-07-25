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

-- Clipboard settings
vim.opt.clipboard = "unnamedplus"

--- MISC ---
-- Rempaps leader to semicolon
vim.g.mapleader = " ";
vim.g.maplocalleader = ",";

-- Enables mouse support
vim.opt.mouse = "a"

--- FUNCTIONS ---
vim.api.nvim_set_keymap("n", "<Leader>h", ":hlsearch!<CR>", { noremap = true, silent = false })
