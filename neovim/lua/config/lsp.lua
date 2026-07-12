-- ----------
-- ESLint
-- ----------
vim.lsp.config('eslint', {
  settings = {
    run = "onSave",
  },
})
vim.lsp.enable('eslint')

-- ----------
-- TypeScript
-- ----------
vim.lsp.config('ts_ls', {})
vim.lsp.enable('ts_ls')

-- ----------
-- C Language
-- ----------
vim.lsp.config('clangd', {
  cmd = {
    "clangd",
    "--enable-config",
    "--background-index",
    "--clang-tidy",
  },
})
vim.lsp.enable('clangd')

-- ----------
-- Rust
-- ----------
vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    },
  },
})
vim.lsp.enable("rust_analyzer")

-- ----------
-- Nix
-- ----------
vim.lsp.config("nil_ls", {})
vim.lsp.enable("nil_ls")

-- ----------
-- CSS
-- ----------
vim.lsp.config("cssls", {})
vim.lsp.enable("cssls");

--- ---------
--- TOML
--- ---------
vim.lsp.config("tombi", {})
vim.lsp.enable("tombi");
