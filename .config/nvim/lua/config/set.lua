vim.g.mapleader = ' '
vim.g.maplocalleader = ';'

vim.opt.nu = true               -- Enable Line Numbers
vim.opt.mouse = 'a'             -- Enable Mouse Mode

-- Loading clipboard from WSL takes ~300ms, this waits until the UI has loaded to to do
-- preventing a minor pause when starting up Neovim
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.hidden = true           -- Keep buffers open even if no edits were made

-- Save undo history to a file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = vim.env.HOME .. '/.cache/nvim/undodir'
vim.opt.undofile = true

-- Always show sign column to prevent text shifting horizontally
vim.opt.signcolumn = 'yes'

-- Highlights the line the cursor is on
vim.opt.cursorline = true

-- Hide cmd line unless entering a command
vim.opt.cmdheight = 0

-- Case insensitive search by unless you put \C or one or more capital letters in the search
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Controls where new window is placed during a split
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Makes screen update sooner
vim.opt.updatetime = 250
-- Displays which-key sooner
vim.opt.timeoutlen = 300

-- Display characters for white space
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
