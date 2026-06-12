require("mason-lspconfig").setup {
  -- Install LSP Automatically
  ensure_installed = {
    "clangd",
    "eslint",
    "ts_ls",
    "lua_ls"
  }
}
