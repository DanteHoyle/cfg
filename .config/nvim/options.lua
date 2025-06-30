local g = vim.g
local opt = vim.opt

-- set the leader key to Space
g.mapleader = ' '
g.maplocalleader = ';'

-- sets system clipboard as the default (wrapped in vim.schedule to prevent )
vim.schedule(function() opt.clipboard:append "unnamedplus" end)

-- enable the mouse
opt.mouse = 'a'

-- disable swap file
opt.swapfile = false

-- save undo history to a file
opt.undofile = true
opt.undodir = vim.env.HOME .. '/.cache/nvim/undodir'

-- tabs/Spaces
opt.smartindent = true          -- Smart auto indenting on newline
opt.expandtab = true
opt.tabstop = 4                  -- size of <TAB> in spaces
opt.shiftwidth = 4               -- size of an indentation (sw).
opt.softtabstop = 4              -- number of spaces a <Tab> counts for. When 0, feature is off (sts).
opt.foldlevel = 99

-- enable line numbers
opt.number = true
opt.numberwidth = 2

-- highlight the line the cursor is on
opt.cursorline = true

-- always show sign column to prevent text shifting horizontally
opt.signcolumn = 'yes'

-- show whitespace characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- split down and to the right
opt.splitright = true
opt.splitbelow = true

-- case sensitive search
opt.smartcase = true

-- keep unchanged buffers open when editing other files
opt.hidden = true

-- lower the delay before the screen updates
opt.updatetime = 250
opt.timeoutlen = 301
