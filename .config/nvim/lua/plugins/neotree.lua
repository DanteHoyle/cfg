-- File: _neo-tree.lua
-- Description: This plugin provides a nice sidebar file explorer 
-- Now using as a repalcement for nvim-tree

return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
        '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        filesystem = {
            hijack_netrw_behavior = 'open_current',
        },
        vim.api.nvim_set_keymap('n', '<Leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true }),
        vim.api.nvim_set_keymap('n', '<Leader>g', ':Neotree toggle <CR>', { noremap = true, silent = true }),
    },
};

