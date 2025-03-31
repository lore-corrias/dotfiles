require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "dotls" },
}

require("lspconfig").lua_ls.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").bashls.setup {}
