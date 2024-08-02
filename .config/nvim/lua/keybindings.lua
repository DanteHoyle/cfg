-- File: keybindings.lua
-- This is where custom rebinds go for Neovim

-- Language Server 
-- Go to symbol definition even if it's in another file
vim.api.nvim_set_keymap("n", "<Leader>d", ":lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>n", ":lua vim.diagnostic.goto_next()<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader>p", ":lua vim.diagnostic.goto_prev()<CR>", { noremap = true, silent = false })

-- Telescope
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":Telescope<CR>", { noremap = true, silent = false })
vim.api.nvim_set_keymap("n", "<Leader-w>", ":Telescope buffers<CR>", { noremap = true, silent = false })
