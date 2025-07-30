local augroup = vim.api.nvim_create_augroup

local autocmd = vim.api.nvim_create_autocmd

-- visually show highlight when yanking text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('YankHLAttach', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})

autocmd('LspAttach', {
  group = augroup('FoldLSPAttach', { clear = true }),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
})
