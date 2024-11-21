-- File: treesitter.lua

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = 'hiphish/rainbow-delimiters.nvim',

    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python', 'org' },
            highlight = {
                enable = true,
            },
            indent = { enable = true },
        })
    end,
}
