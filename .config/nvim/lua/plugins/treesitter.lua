return {
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    opts = {
        auto_install = true,
        ensure_installed = {
            "c", "lua", "vim", "vimdoc", "query", "python", "bash", "html",
            "markdown", "markdown_inline", "javascript", "typescript"
        },

        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
            enable = true,
        },

        disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
    },
}
