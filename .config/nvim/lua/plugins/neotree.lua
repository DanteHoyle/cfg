return {
    "nvim-neo-tree/neo-tree.nvim",

    lazy = false,

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },

  ---@module "neo-tree"
  ---@type neotree.Config?
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
            },
        },
        window = {
            position = 'float',
        },
        sources = {
            'filesystem',
            'document_symbols',
        }
    },

    keys = {
        {
            '<leader>e',
            '<cmd>Neotree toggle float<CR>',
            desc = 'Browse Filesystem with Neotree'
        },
        {
            '<leader>s',
            '<cmd>Neotree toggle document_symbols right<CR>',
            desc = 'View document symbols with Neotree',
        }
    },
}
