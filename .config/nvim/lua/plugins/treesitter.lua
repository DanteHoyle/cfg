-- File: treesitter.lua

return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    dependencies = 'hiphish/rainbow-delimiters.nvim',
    opts = {
        auto_install = true,
        ensure_installed = { 'c', 'lua', 'vim', 'vimdoc', 'query', 'python'},
        highlight = { enable = true, },
        indent = { enable = true },
    }
}
