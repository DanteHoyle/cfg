-- File: language-server.lua
require("mason").setup()
require("mason-lspconfig").setup()

require("lspconfig").lua_ls.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}

require("lspconfig").pyright.setup {
    settings = {
        python = {
            analysis = {
                typeCheckingMode = { "basic" }
            }
        }
    }
}

require("lspconfig").tsserver.setup {}


