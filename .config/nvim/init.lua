-- File:	    init.lua
-- Description: This is the first lua file ran by nvim upon startup

require("config")
require("functions")

-- Loads all plugins in the /nvim/lua/plugins directory
require("lazy").setup("plugins")

