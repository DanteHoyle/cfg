-- File:    lazy_hotkeys

-- Plugin Hotkeys -------------------------------------------------------------
-- Binds <Space><Space> to WhichKey 
vim.api.nvim_set_keymap('n', '<Space><Space>', ':WhichKey<CR>', { noremap = true, silent = true })
