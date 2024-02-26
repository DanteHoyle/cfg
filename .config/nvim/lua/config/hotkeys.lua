-- File: hotkeys.lua

--- Hot Keys -------------------------------------------------------------------
-- remaps <Leader>
vim.g.mapleader = ";";

-- maps <Leader> + <Leader> to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })

-- maps <Leader> + f to toggle NeovimTree
vim.api.nvim_set_keymap("n", "<Leader>f", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

-- maps <F12> to toggle between tabs and spaces
vim.api.nvim_set_keymap("n", "<F12>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })
