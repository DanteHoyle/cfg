-- File: colorschemes.lua
-- Description: Master File for loading colorscheme plugins using lazy.nvim

return {
    {
        'catppuccin/nvim',
        lazy = false,
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                no_italic = true,
            }
        end,
        enabled=true
    },
    {
        'miikanissi/modus-themes.nvim',
        name = 'modus',
        lazy = false,
        priority = 1000,
        enabled=true
    },
    {
        'bluz71/vim-moonfly-colors',
        name = 'moonfly',
        config = function()
            vim.cmd [[colorscheme moonfly]]
        end,
    }
};
