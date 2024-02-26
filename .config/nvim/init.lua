-- FILE:    init.lua
-- FOLDER:  nvim

-- Load My Config -------------------------------------------------------------
require("config/hotkeys")
require("config/mouse")

-- Tab Settings
vim.opt.tabstop = 8
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Remap Leader (Must be before plugins)

-- Plugins --------------------------------------------------------------------
-- Plugin Manager: https://github.com/folke/lazy.nvim

-- Bootstrap lazy.nvim
require("plugins/bootstrap")

-- Load plugins from plugins.lua
require("lazy").setup("plugins/plugins")

require("config/theme")
