vim.g.mapleader = ' '
vim.g.maplocalleader = ';'
vim.opt.mouse = 'a'                 -- Enable Mouse Mode
-- History
vim.opt.swapfile = false
vim.opt.undofile = true             -- Save undo history to a file
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim/undodir'
-- Visual
vim.opt.number = true               -- Enable Line Numbers
vim.opt.cursorline = true           -- Highlights the line the cursor is on
vim.opt.signcolumn = 'yes'          -- Always show sign column to prevent text shifting horizontally
vim.opt.list = true                 -- Display characters for white space
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Tabs/Spaces
vim.opt.smartindent = true          -- Smart auto indenting on newline
vim.opt.expandtab = true
-- Search behavior
vim.opt.smartcase = true            -- Case insensitive search by unless you put \C or one or more capital letters in the search
vim.opt.inccommand = 'split'        -- Preview substitutions live in a split window
-- Screen
vim.opt.hidden = true               -- Keep buffers open even if no edits were made
vim.opt.updatetime = 250            -- Makes screen update sooner
vim.opt.timeoutlen = 301            -- Displays which-key sooner
-- Prevent an annoying startup delay on some systems
vim.schedule( function() vim.opt.clipboard = 'unnamedplus' end )
