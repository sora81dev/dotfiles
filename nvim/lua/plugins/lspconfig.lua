return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      servers = {
        bacon_ls = {
          enabled = diagnostics == "bacon-ls",
        },
        rust_analyzer = { enabled = false },
      },
    },
    config = function()
      vim.lsp.config('eslint', {
        settings = {
          run = "onSave",
        },
      })
      vim.lsp.enable('eslint')

      vim.lsp.config('ts_ls', {})
      vim.lsp.enable('ts_ls')

      vim.lsp.config('clangd', {
        cmd = {
          "clangd",
          "--enable-config",
          "--background-index",
          "--clang-tidy",
        },
      })
      vim.lsp.enable('clangd')

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
    end,
  },
}
