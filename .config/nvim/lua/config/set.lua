vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

vim.opt.nu = true                   -- Enable Line Numbers
vim.opt.mouse = 'a'                 -- Enable Mouse Mode

vim.opt.smartindent = true          -- Smart auto indenting on newline
-- vim.opt.tabstop = 4
-- vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hidden = true               -- Keep buffers open even if no edits were made

vim.opt.swapfile = false            -- Save undo history to a file
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim/undodir'
vim.opt.undofile = true

vim.opt.signcolumn = 'yes'          -- Always show sign column to prevent text shifting horizontally

-- Highlights the line the cursor is on
vim.opt.cursorline = true

-- Hide cmd line unless entering a command
vim.opt.cmdheight = 1

-- Case insensitive search by unless you put \C or one or more capital letters in the search
vim.opt.smartcase = true
vim.opt.incsearch = true

vim.opt.inccommand = 'split'                        -- Preview substitutions live in a split window

-- Controls where new window is placed during a split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Makes screen update sooner
vim.opt.updatetime = 250
-- Displays which-key sooner
vim.opt.timeoutlen = 300
-- Prevent an annoying startup delay on some systems
vim.schedule( function() vim.opt.clipboard = 'unnamedplus' end )

-- Display characters for white space
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
