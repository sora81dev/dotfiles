require("mason-lspconfig").setup {
  -- Install LSP Automatically
  ensure_installed = {
    "clangd",       -- C Language
    "eslint",       -- Formatter
    "ts_ls",        -- Typescript
    "lua_ls",       -- Lua
    "tailwindcss",  -- Tailwind CSS
    "rust_analyzer" -- Rust Analyzer
  }
}
