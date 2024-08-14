-- File: init.lua
-- Description: This is the first lua file ran by nvim upon startup

require('editor')

-- Loads all plugins in the /nvim/lua/plugins directory
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
require('lazy').setup('plugins')

-- this must come after lazy sets up plugins so plugin specific settings are loaded
require('keybindings')
