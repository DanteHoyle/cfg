-- File: nvim-tree.lua

return {
    { -- Nvim-Tree
        'nvim-tree/nvim-tree.lua',

        enabled = false,

        config = function()
            require('nvim-tree').setup({
                filters = { dotfiles = true },
                view = { width = 30 },
            })

            vim.keymap.set('n', '<leader>ft', '<cmd>NvimTreeFindFileToggle<CR>',  { desc = 'Toggle Nvim-[T]ree' })
        end,
    },
}
