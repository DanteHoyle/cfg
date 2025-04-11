return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  enabled = true,
  opts = {
    options = {
      globalstatus = true
    },
    sections = {
      lualine_b = {'branch', 'diff'}
    },
    tabline = {
      lualine_a = {'tabs', 'buffers'},
      lualine_b = {},
      lualine_c = {},
      lualine_x = {'diagnostics', 'lsp_status'},
      lualine_y = {'searchcount'},
      lualine_z = {}
    }
  }
}
