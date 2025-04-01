-- File: keymaps.lua

-- NORMAL MODE

-- Clear highlights with escape
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })

-- Toggle line wrapping with Leader + w
vim.keymap.set('n', '<Leader>W', '<cmd>set wrap!<CR>', { desc = 'Toggle line wrapping' })

-- Center the screen when moving up or down in a file
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
-- INSERT MODE
-- Delete words in insert mode with Alt + Backspace
vim.keymap.set('i', '<M-BS>', '<C-W>')

local lsp_map = function()
    -- Small helper function to map keys to telescope functions
    local map = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
    end

    local builtin = require('telescope.builtin')
    -- LSP
    map('<Leader>r', vim.lsp.buf.rename, 'LSP [R]ename')
    map(']d', function() vim.diagnostic.jump({count = 1, float = true}) end, 'Next [D]iagnostic')
    map('[d', function() vim.diagnostic.jump({count = -1, float = true}) end, 'Previous [D]iagnostic')

    map('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
    map('gr', builtin.lsp_references, '[G]oto [R]eferences')
    map('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('MyLspAttach', { clear = true }),
    callback = lsp_map
})
