return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- enable LSP completions for markdown files
      completions = { lsp = { enabled = true } },
      pipe_table = {
        padding = 0,
        cell = 'trimmed', -- alternative: minimal spacing while keeping alignment
        style = 'normal', -- optional: fewer horizontal separators (less vertical bulk)
        border_enabled = false, -- optional: hide borders entirely
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  { 'dhruvasagar/vim-table-mode' }
}
