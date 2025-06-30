-- File: init.lua

return {
  {
    "kylechui/nvim-surround",
    keys = { "ys", "ds", "cs" },
    config = true,
  },
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    dependencies = { 'echasnovski/mini.icons' },
    opts = { preset = 'modern' },
    keys = {
      { '<leader>?', function() require('which-key').show({ global = false }) end, desc = 'Buffer Local Keymaps (which-key)', },
    },
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>', desc = 'Navigate Left (TmuxNavigator)' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>', desc = 'Navigate Down (TmuxNavigator)' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>', desc = 'Navigate Up (TmuxNavigator)' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>', desc = 'Navigate Right (TmuxNavigator)' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>', desc = 'Navigate Previous (TmuxNavigator)' },
    },
  },
}
