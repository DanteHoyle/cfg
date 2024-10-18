require('config.set')
require('config.keymaps')

local augroup = vim.api.nvim_create_augroup
local LocalAutoGroup = augroup('LocalAutoGroup', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

-- visually show highlight when yanking text
autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd('LspAttach', {
    desc = 'Load LSP shortcuts',
    group = LocalAutoGroup,
    callback = function()
        vim.keymap.set('n', '<Leader>r', function() vim.lsp.buf.rename() end, { desc = 'LSP Rename' } )
        vim.keymap.set('n', '<M-CR>', function() vim.lsp.buf.code_action() end, { desc = 'LSP Code Action' } )
    end,
})

require('config.lazy')
