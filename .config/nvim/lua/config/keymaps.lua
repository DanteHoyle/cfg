local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  desc = desc or ''
  vim.keymap.set(mode, keys, func, { desc =  desc })
end

map('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights') -- Clear highlights with escape
map('<Leader>W', '<cmd>set wrap!<CR>','Toggle line wrapping') -- Toggle line wrapping with Leader + w
map('<C-d>', '<C-d>zz')   -- Center the screen when moving up or down in a file
map('<C-u>', '<C-u>zz')   -- Center the screen when moving up or down in a file
map('<M-BS>', '<C-W>', 'Delete words with alt + backspace', 'i') -- Delete words in insert mode with Alt + Backspace
map('<leader>n', '<cmd>bnext<CR>', 'Next Buffer')
map('<leader>p', '<cmd>bprevious<CR>', 'Previous Buffer')
map('<leader>x', '<cmd>bdelete<CR>', 'Delete Buffer')

-- Telescope keymaps are in this function so it can be scheduled AFTER plugins have bootstrapped
local telescope_remap_func = function()
  local telescope_keymap = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { desc = 'Telescope: ' .. desc })
  end
  local telescope_builtin = require('telescope.builtin')
  telescope_keymap('<leader>ff', telescope_builtin.find_files, 'Find Files')
  telescope_keymap('<leader>fg', telescope_builtin.live_grep, 'Find w/ Grep')
  telescope_keymap('<leader>b', telescope_builtin.buffers, 'Find Buffers')
  telescope_keymap('<leader>fh', telescope_builtin.help_tags, 'Vim Help')
  telescope_keymap('<leader>fd', telescope_builtin.lsp_definitions, 'LSP Definitions' )
  telescope_keymap('<leader><leader>', telescope_builtin.builtin, 'Default Menu')
  telescope_keymap('<F1>', telescope_builtin.help_tags, 'Vim Help Pages')
end
vim.schedule(telescope_remap_func)

-- LSP keymaps are in this function so it can be scheduled AFTER the LSP plugins have bootstrapped
local lsp_keymap_func = function()
  local lsp_keymap = function(keys, func, desc, mode)
    mode = mode or 'n'
    vim.keymap.set(mode, keys, func, { desc = 'LSP: ' .. desc })
  end
  -- LSP
  local telescope_builtin = require('telescope.builtin')
  lsp_keymap('<Leader>r', vim.lsp.buf.rename, 'LSP Rename')
  lsp_keymap(']d', function() vim.diagnostic.jump({count = 1, float = true}) end, 'Next Diagnostic')
  lsp_keymap('[d', function() vim.diagnostic.jump({count = -1, float = true}) end, 'Previous Diagnostic')
  lsp_keymap('gd', telescope_builtin.lsp_definitions, 'Goto Definition')
  lsp_keymap('gR', telescope_builtin.lsp_references, 'Goto References')
  lsp_keymap('gI', telescope_builtin.lsp_implementations, 'Goto Implementation')
  lsp_keymap('<leader>ca', vim.lsp.buf.code_action, 'Code Action', { 'n', 'x' })
  lsp_keymap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
end
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('MyLspAttach', { clear = true }),
  callback = lsp_keymap_func
})

