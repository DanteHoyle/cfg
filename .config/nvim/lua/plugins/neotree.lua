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
    sources = {
      'filesystem',
      'buffers',
      'document_symbols',
    }
  },

  keys = {
    {
      '<leader>e',
      '<cmd>Neotree toggle float<CR>',
      desc = 'Toggle filesystem (Neotree)'
    },
    {
      '<leader>s',
      '<cmd>Neotree toggle document_symbols right<CR>',
      desc = 'Toggle document symbols pane',
    },
    {
      '<leader>b',
      '<cmd>Neotree toggle buffers left<CR>',
      desc = 'Toggle buffers pane',
    }
  },
}
