-- File:	    init.lua
-- Description: This is the first lua file ran by nvim upon startup

-- Loads my custom config scripts
require("config/editor")
require("config/keyboard")

-- Loads my custom cunctions
require("functions")

-- Bootstrap lazy.nvim
require("bootstrap")

-- Loads all plugins in the /nvim/lua/plugins directory
require("lazy").setup("plugins")

