-- File: hotkeys.lua

--- Mouse ---
-- Enable Mouse
vim.opt.mouse = 'a'

--- General Remaps ---
-- remaps <Leader>
vim.g.mapleader = ";";
-- maps F1 to clear highlighted matches
vim.api.nvim_set_keymap("n", "<F1>", ":noh<CR>", { noremap = true, silent = true })

--- Insert Mode Remaps ---
-- Leader + b for bold in Neorg
vim.api.nvim_set_keymap("i", "<Leader>b", "**<Esc>i", { noremap = true, silent = true })
-- Leader + i for italic in Neorg 
vim.api.nvim_set_keymap("i", "<Leader>i", "//<Esc>i", { noremap = true, silent = true })
-- Leader + u for underline in Neorg
vim.api.nvim_set_keymap("i", "<Leader>u", "__<Esc>i", { noremap = true, silent = true })

--- My Scripts ---
-- maps F12 to toggle between tabs and spaces
vim.api.nvim_set_keymap("n", "<F12>", ":lua toggle_tabs()<CR>", { noremap = true, silent = true })


--- Begin Plugin Config ---
--- WhichKey ---
-- maps Leader + Leader to open WhichKey
vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":WhichKey<CR>", { noremap = true, silent = true })

--- NvimTree ---
-- maps Leader +  to focus NvimTree
vim.api.nvim_set_keymap("n", "<Leader><BS>", ":NvimTreeFocus<CR>", { noremap = true, silent = true })
-- maps Leader + Backspace to toggle NvimTree
vim.api.nvim_set_keymap("n", "<Leader><C-i>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

--- Telescope ---
-- maps <Leader> + P to open telescope
vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope<CR>", { noremap = true, silent = true })
--- End Plugin Config ---
