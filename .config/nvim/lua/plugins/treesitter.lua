-- File: treesitter.lua

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',

    config = function()
        local opts = {
            auto_install = true,
            ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python' },
            highlight = { enable = true },
            indent = { enable = true },
        }
        require('nvim-treesitter.configs').setup(opts)
    end,
}
