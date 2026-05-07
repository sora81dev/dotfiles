return {
  -- 1. フォーマッタの実行管理 (Conform)
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" }, -- 保存前に実行
    cmd = { "ConformInfo" },
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
      },
      -- 保存時に自動で整形する設定
      format_on_save = {
        timeout_ms = 500,
        lsp_fallback = true, -- Prettierがない場合はLSPで整形
      },
    },
  }
}
