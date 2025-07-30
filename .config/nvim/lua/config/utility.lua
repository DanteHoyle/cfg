local M = {}

-- Open the current file externally
function M.open_current_file()
  local path = vim.fn.expand("%")
  vim.ui.open(path)
end

-- KEYMAP FUNCTIONS
-- Utility map function
function M.map(keys, func, desc, mode)
  if desc then
    vim.keymap.set(mode, keys, func, { desc = desc })
  else
    vim.keymap.set(mode, keys, func)
  end
end

-- Normal mode keymap
function M.nmap(keys, func, desc)
  M.map(keys, func, desc, 'n')
end

-- Insert mode keymap
function M.imap(keys, func, desc)
  M.map(keys, func, desc, 'i')
end

-- Telescope keymaps
function M.tmap(keys, func, desc)
  M.nmap(keys, func, 'Telescope: ' .. desc)
end

-- LSP keymaps
function M.lmap(keys, func, desc)
  M.nmap(keys, func, 'LSP: ' .. desc)
end

return M
