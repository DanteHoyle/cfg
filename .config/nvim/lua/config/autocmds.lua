local augroup = vim.api.nvim_create_augroup

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

-- Org Mode
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'org',
    callback = function()
        vim.opt_local.conceallevel = 2
        vim.opt.concealcursor = 'nc'
        vim.opt_local.wrap = false
    end,
})
