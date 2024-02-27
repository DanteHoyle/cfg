-- File: telescope.lua
return {
    {
        "nvim-telescope/telescope.nvim",
        tag = '0.1.5',
        extensions = {
            file_browser = {}
        },

        sync_with_nvim_tree = true,
        theme = dropdown,
        
    },
}
