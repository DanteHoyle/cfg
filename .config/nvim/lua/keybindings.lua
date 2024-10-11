-- File: keybindings.lua

-- Clear search highlight with Leader + h
vim.keymap.set('n', '<Leader>h', '<cmd>nohls<CR>')
-- Toggle line wrapping with Leader + w
vim.keymap.set('n', '<Leader>w', '<cmd>set wrap!<CR>')
-- Delete words in insert mode with Alt + Backspace
vim.keymap.set('i', '<M-BS>', '<C-W>')
-- LSP Keybindings
vim.keymap.set('n', '<Leader>r', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<Leader>R', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', '<M-CR>', function() vim.lsp.buf.code_action() end)
