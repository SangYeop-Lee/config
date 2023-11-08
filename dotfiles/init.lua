require("mason").setup()
require("mason-lspconfig").setup()

local lspconfig = require("lspconfig")

lspconfig.lua_ls.setup {}
lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.dockerls.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.taplo.setup {}

