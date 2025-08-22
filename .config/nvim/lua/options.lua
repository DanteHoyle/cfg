local g = vim.g
local o = vim.o
local opt = vim.opt
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-------------------
--GENERAL OPTIONS--
-------------------

-- set the leader key to Space
g.mapleader = ' '
g.maplocalleader = ';'

-- sets system clipboard as the default (wrapped in vim.schedule to prevent startup lag)
vim.schedule(function() opt.clipboard:append "unnamedplus" end)

-- enable the mouse
o.mouse = 'a'

-- disable swap file
o.swapfile = false

-- save undo history to a file
o.undofile = true
o.undodir = vim.env.HOME .. '/.cache/nvim/undodir'

-- keep unchanged buffers open when editing other files
o.hidden = true

-- lower the delay before the screen updates
o.updatetime = 250
o.timeoutlen = 301

-- highlight the line the cursor is on
o.cursorline = true

-- only show cursorline in active window normal mode
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter", "TabEnter", "TermLeave" }, {
  group = vim.api.nvim_create_augroup("SmartCursorline", { clear = false }),
  desc = "Enable cursorline only in active window",
  callback = function()
    vim.wo.cursorline = vim.bo.buftype == ""
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave", "TabLeave" }, {
  group = vim.api.nvim_create_augroup("SmartCursorline", { clear = false }),
  desc = "Enable cursorline only in active window",
  callback = function()
    vim.wo.cursorline = false
  end,
})

autocmd({ "OptionSet", "WinEnter", "VimEnter" }, {
  group = augroup("SmartTextWidth", { clear = true }),
  desc = "Enable text width only when wrap is disabled",
  pattern = "wrap",
  callback = function()
    if opt.wrap:get() then
      vim.cmd("setlocal tw=0")
    else
      vim.cmd("setlocal tw=80")
    end
  end,
})

-----------------------------------
--LINE NUMBERS AND FOLDING OPTIONS--
-----------------------------------
-- enable line numbers
o.number = true

-- enable line folding
o.foldlevel = 99

-- always show sign column to prevent text shifting horizontally when LSP detects errors
o.signcolumn = 'yes'

o.foldmethod = 'expr'
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldtext = ""

autocmd('LspAttach', {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method('textDocument/foldingRange') then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end
  end,
})

-------------------------
--TEXT & EDITOR OPTIONS--
-------------------------

-- use ~/.editorconfig for most charset and tab settings
g.editorconfig = true

-- match indentation level for new lines
o.autoindent = true

-- show whitespace characters
o.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

----------------
--MISC OPTIONS--
----------------

-- split down and to the right
o.splitright = true
o.splitbelow = true

-- case sensitive search
o.smartcase = true

o.winborder = "rounded"

-- visually show highlight when yanking text
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('YankHLAttach', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank()
  end,
})
