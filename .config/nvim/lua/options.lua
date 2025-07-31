local g = vim.g
local opt = vim.opt

-------------------
--GENERAL OPTIONS--
-------------------

-- set the leader key to Space
g.mapleader = ' '
g.maplocalleader = ';'

-- sets system clipboard as the default (wrapped in vim.schedule to prevent startup lag)
vim.schedule(function() opt.clipboard:append "unnamedplus" end)

-- enable the mouse
opt.mouse = 'a'

-- disable swap file
opt.swapfile = false

-- save undo history to a file
opt.undofile = true
opt.undodir = vim.env.HOME .. '/.cache/nvim/undodir'

-- keep unchanged buffers open when editing other files
opt.hidden = true

-- lower the delay before the screen updates
opt.updatetime = 250
opt.timeoutlen = 301

-- highlight the line the cursor is on
opt.cursorline = true

-----------------------------------
--LINE NUMBERS AND FOLDING OPTIONS--
-----------------------------------
---
-- enable line numbers
opt.number = true

-- enable line folding
opt.foldlevel = 99

-- always show sign column to prevent text shifting horizontally when LSP detects errors
opt.signcolumn = 'yes'

-------------------------
--TEXT & EDITOR OPTIONS--
-------------------------

-- use ~/.editorconfig for most charset and tab settings
g.editorconfig = true

-- match indentation level for new lines
opt.autoindent = true

-- show whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

----------------
--MISC OPTIONS--
----------------

-- split down and to the right
opt.splitright = true
opt.splitbelow = true

-- case sensitive search
opt.smartcase = true
