-- File: keybindings.lua
--- KEYBINDS ---
-- Clear search highlight with Leader + h
vim.api.nvim_set_keymap('n', '<Leader>H', ':nohls<CR>', { noremap = true, silent = false })
-- Toggle line wrapping with Leader + w
vim.api.nvim_set_keymap('n', '<Leader>w', ':set wrap!<CR>', { noremap = true, silent = false })
-- Delete words in insert mode with Alt + Backspace
vim.api.nvim_set_keymap('i', '<M-BS>', '<C-W>', { noremap = true, silent = false })

