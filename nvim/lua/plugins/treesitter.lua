return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = { "html", "javascript", "typescript", "tsx", "lua", "rust", "ron", "regex", "bash" },
      highlight = { enable = true },
      indent = { enable = true },
    },
    config = function(_, opts)
      vim.opt.runtimepath:prepend("/Users/sora81dev/.local/share/nvim/site/")
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if ok then
        configs.setup(opts)
      end

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "typescriptreact", "javascriptreact" },
        callback = function()
          vim.bo.indentexpr = "nvim_treesitter#indent()"
        end
      })
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {}
  },
}
