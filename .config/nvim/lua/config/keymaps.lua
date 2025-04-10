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

-- Changing Buffers
vim.keymap.set('n', '<leader>n', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<leader>p', '<cmd>bprevious<CR>', { desc = 'Previous Buffer' })
vim.keymap.set('n', '<leader>x', '<cmd>bdelete<CR>', { desc = 'Delete Buffer' })

local lsp_remap = function()
    -- Small helper function to map keys to telescope functions
    local lsp_vim_keymap_set = function(keys, func, desc, mode)
        mode = mode or 'n'
        vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
    end

    local telescope = require('telescope.builtin')
    -- LSP
    lsp_vim_keymap_set('<Leader>r', vim.lsp.buf.rename, 'LSP Rename')
    lsp_vim_keymap_set(']d', function() vim.diagnostic.jump({count = 1, float = true}) end, 'Next Diagnostic')
    lsp_vim_keymap_set('[d', function() vim.diagnostic.jump({count = -1, float = true}) end, 'Previous Diagnostic')

    lsp_vim_keymap_set('gd', telescope.lsp_definitions, 'Goto Definition')
    lsp_vim_keymap_set('gR', telescope.lsp_references, 'Goto References')
    lsp_vim_keymap_set('gI', telescope.lsp_implementations, 'Goto Implementation')
    lsp_vim_keymap_set('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
    lsp_vim_keymap_set('gD', vim.lsp.buf.declaration, 'Goto Declaration')
end

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('MyLspAttach', { clear = true }),
    callback = lsp_remap
})
