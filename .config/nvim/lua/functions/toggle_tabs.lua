-- File: tabtoggle.lua
-- Description: This function will toggle between tabs and spaces

-- The number of spaces used for a tab and other related settings are defined
-- in config/editor.

local spaces = true

function toggle_tabs()
    if spaces then
        print("Tab Mode")
        spaces = false

        vim.opt.expandtab = false
        vim.opt.softtabstop = 0
    else
        print("Spaces Mode")
        spaces = true

        vim.opt.expandtab = true
        vim.opt.softtabstop = 4
    end
end
