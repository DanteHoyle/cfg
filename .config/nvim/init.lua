--- General Config

-- Sets up relative line numbering with absolute position on current line
vim.opt.relativenumber = true
vim.opt.nu = true

-- Enables Mouse Support
vim.opt.mouse = 'a'

-- Tab Settings
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Remap Leader (Must be before plugins)
vim.g.mapleader = " ";

--- Plugins
-- Plugin Manager: https://github.com/folke/lazy.nvim

-- Bootstrap lazy.nvim
require("bootstrap")

-- Load plugins from plugins.lua
require("lazy").setup("plugins")
