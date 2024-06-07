-- File: _vimwiki.lua
-- Description: Plugin for organizing markdown notes

return {
    "vimwiki/vimwiki",

    init = function()
        vim.g.vimwiki_list = {
            {
                path = "~/documents/notes/",
                syntax = "markdown",
                ext = ".md"
            }
        }
    end
}
