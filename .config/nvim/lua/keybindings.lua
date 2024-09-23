-- File: keybindings.lua
--- KEYBINDS ---
-- Clear search highlight with Leader + h
vim.api.nvim_set_keymap('n', '<Leader>H', ':nohls<CR>', { noremap = true, silent = false })
-- Toggle line wrapping with Leader + w
vim.api.nvim_set_keymap('n', '<Leader>w', ':set wrap!<CR>', { noremap = true, silent = false })

-- Allows moving between neovim panes with Ctrl + hjkl or arrow keys
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = false })

-- LSP Keyboard Shortcuts
vim.api.nvim_set_keymap('n', '<Leader>d', ':tab split | lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>n', ':lua vim.diagnostic.goto_next()<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>p', ':lua vim.diagnostic.goto_prev()<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>r', ':lua Telescope lsp_references', { noremap = true, silent = false })

-- Neotree Keyboard Shortcuts
vim.api.nvim_set_keymap('n', '<Leader>f', ':Neotree toggle<CR>', { noremap = true, silent = true })

-- Vim Telescope
vim.api.nvim_set_keymap('n', '<Leader><Leader>', ':Telescope<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<Leader>b', ':Telescope buffers<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = false })
vim.api.nvim_set_keymap('n', '<LocalLeader>f', ':Telescope find_files <CR>', { noremap = true, silent = false })
