-- File: keymaps.lua

-- NORMAL MODE

-- Clear highlights with escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Toggle line wrapping with Leader + w
vim.keymap.set('n', '<Leader>w', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Center the screen when moving up or down in a file
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- INSERT MODE
-- Delete words in insert mode with Alt + Backspace
vim.keymap.set('i', '<M-BS>', '<C-W>')

-- VISUAL MODE
-- Move lines
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move block one line down' })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move block one line up' })

-- TERMINAL MODE
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- LSP
vim.keymap.set('n', '<Leader>r', function() vim.lsp.buf.rename() end, { desc = 'LSP Rename' } )
vim.keymap.set('n', '<M-CR>', function() vim.lsp.buf.code_action() end, { desc = 'LSP Code Action' } )
vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, { desc = 'Next diagnostic' } )
vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, { desc = 'Previous diagnostic' } )

