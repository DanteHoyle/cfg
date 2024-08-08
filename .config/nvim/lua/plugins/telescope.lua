return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        vim.api.nvim_set_keymap("n", "<Leader><Leader>", ":Telescope<CR>", { noremap = true, silent = false }),
        vim.api.nvim_set_keymap("n", "<Leader>b", ":Telescope buffers<CR>", { noremap = true, silent = false }),
        vim.api.nvim_set_keymap("n", "<C-p>", ":Telescope find_files<CR>", { noremap = true, silent = false }),
    },
};
