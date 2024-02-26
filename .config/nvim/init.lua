-- File:	init.lua
-- Folder:	nvim
-- Description: This is the first lua file ran by nvim upon startup

-- Load My Config -------------------------------------------------------------
require("config/hotkeys")
require("config/mouse")
require("config/editor")

-- Plugins --------------------------------------------------------------------

-- Bootstrap lazy.nvim
require("bootstrap")
-- Load plugins from plugins.lua
require("lazy").setup("plugins")

require("config/theme")
