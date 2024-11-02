local ft_map = {
    python = 'treesitter'
}

return {
    'kevinhwang91/nvim-ufo',
    event = 'LspAttach',
    dependencies = { 'kevinhwang91/promise-async' },
    init = function()
        vim.o.foldcolumn = '0'
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        -- vim.o.fillchars = 'eob: ,fold: ,foldopen:,foldsep: ,foldclose:'
    end,
    opts = {
        provider_selector = function (bufnr, filetype, buftype)
            return ft_map[filetype]
        end
    },
}
