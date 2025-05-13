-- File: colors.lua
-- Highlight todo, notes, etc in comments

return {
  { "catppuccin/nvim", name = "catppuccin", },
  {
    'scottmckendry/cyberdream.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd [[colorscheme cyberdream]]
    end,
  },
  {
    'mechatroner/rainbow_csv'
  }
}
