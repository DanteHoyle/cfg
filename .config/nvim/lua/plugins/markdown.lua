return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {
      completions = { lsp = { enabled = true } },
    },
  },
  { 'dhruvasagar/vim-table-mode' }
}
