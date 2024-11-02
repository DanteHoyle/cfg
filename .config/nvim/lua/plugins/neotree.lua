return {
    "nvim-neo-tree/neo-tree.nvim",

    lazy = false,

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },

    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
        window = {
            position = 'float',
        },
    },

    keys = {
        {
            '<leader>e',
            '<cmd>Neotree toggle float<CR>',
            desc = 'Neo-Tree Toggle'
        },
    },
}
