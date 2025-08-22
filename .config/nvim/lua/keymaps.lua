local util = require 'config.utility'

-- Clear current highlights with Esc
util.nmap('<Esc>', '<cmd>nohlsearch<CR>', 'Clear highlights')
-- Toggle line wrapping with <Leader>W
util.nmap('<Leader>W', '<cmd>set wrap!<CR>','Toggle line wrapping') -- Toggle line wrapping with Leader + w
util.nmap('<C-d>', '<C-d>zz')   -- Center the screen when moving up or down in a file
util.nmap('<C-u>', '<C-u>zz')   -- Center the screen when moving up or down in a file
util.imap('<M-BS>', '<C-W>', 'Delete words with alt + backspace') -- Delete words in insert mode with Alt + Backspace
util.nmap('<leader>n', '<cmd>bnext<CR>', 'Next Buffer')
util.nmap('<leader>p', '<cmd>bprevious<CR>', 'Previous Buffer')
util.nmap('<leader>x', '<cmd>bdelete<CR>', 'Delete Buffer')
util.nmap('<leader>o', util.open_current_file, 'Open the current file externaly')

-- LSP Keymaps
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('KeymapLSPAttach', { clear = true }),
  callback = function()
    local tb = require('telescope.builtin')
    util.lmap('<leader>r', vim.lsp.buf.rename, 'Rename symbol')
    util.lmap(']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, 'Next diagnostic')
    util.lmap('[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, 'Prev diagnostic')
    util.lmap('<leader>gr', tb.lsp_references, 'Find references')
    util.lmap('<leader>gd', tb.lsp_definitions, 'Go to definition')
    util.lmap('<leader>qf', tb.quickfix, 'Quickfix')
    util.lmap('<leader>di', tb.diagnostics, 'SP: Show diagnostics')
    util.lmap('<leader>ca', vim.lsp.buf.code_action, 'Code action')
  end
})

-- Plugin Keymaps
vim.schedule(function()
  local tb = require('telescope.builtin')
  local nt = require('neo-tree')
  util.tmap('<leader>ff', tb.find_files, 'Find files')
  util.tmap('<leader>fg', tb.live_grep, 'Live grep')
  util.tmap('<leader><leader>', tb.builtin, 'Built-in pickers')
  util.tmap('<F1>', tb.help_tags, 'Help pages')
  util.tmap('<leader>fh', tb.help_tags, 'Help pages')
end)
