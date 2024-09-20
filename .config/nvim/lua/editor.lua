-- File: editor.lua
-- Description: Contains settings related to text editing 

-- Makes 1 tab press equal four space. When editing a file with tabs, hit <F12>
-- to manually switch between Tabs and Spaces. This runs a function in 
-- functions/toggle_lua.
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.listchars = 'tab:>-,trail:~,nbsp:␣'
vim.opt.list = true

vim.opt.signcolumn = 'yes:1'

-- Relative Line Numbering
vim.opt.number = true
-- vim.opt.numberwidth = 8

-- Uses host OS clipboard
vim.opt.clipboard = 'unnamedplus'

vim.opt.wrap = false

--- MISC ---
-- Rempaps leader to semicolon
vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

-- Enables mouse support
vim.opt.mouse = 'a'
