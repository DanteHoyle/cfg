-- File: treesitter.lua

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    dependencies = 'mrjones2014/nvim-ts-rainbow',

    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python' },
            highlight = { enable = true },
            indent = { enable = true },
            rainbow = { enable = true },
        })
    end,
}
