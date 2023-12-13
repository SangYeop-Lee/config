require("mason").setup()
require("mason-lspconfig").setup {
	ensure_installed = { "clangd", "pyright", "dockerls", "taplo", "svls" },
}

local lspconfig = require("lspconfig")

lspconfig.clangd.setup {}
lspconfig.pyright.setup {}
lspconfig.dockerls.setup {}
lspconfig.taplo.setup {}
lspconfig.svls.setup {}

