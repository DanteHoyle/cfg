return {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  enabled = true,
  opts = {
    options = {
      -- globalstatus = true,
      section_separators = '',
      component_separators = '',
    },
    sections = { lualine_b = {'branch', 'diff'} },
  }
}
