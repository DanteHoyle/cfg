-- File: keymaps.lua

-- NORMAL MODE

-- Open netrw with Leader + e
vim.keymap.set('n', '<leader>e', vim.cmd.Ex, { desc = 'Explore' })

-- Clear highlights with escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear Highlights' })

-- Toggle line wrapping with Leader + w
vim.keymap.set('n', '<Leader>w', '<cmd>set wrap!<CR>', { desc = 'Toggle Line [W]rapping' })

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
