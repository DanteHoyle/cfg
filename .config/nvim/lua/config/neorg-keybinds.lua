-- File: neorg-keybinds.lua
-- maps <Leader> + n to open Neorg workspaces
vim.api.nvim_set_keymap("n", "<Leader>n", ":Neorg ", { noremap = true, silent = false })
