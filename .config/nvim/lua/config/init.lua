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

-- autocmd('LspAttach', {
--     desc = 'Load LSP shortcuts',
--     group = LocalAutoGroup,
--     callback = function()
--     end,
-- })

require('config.lazy')
