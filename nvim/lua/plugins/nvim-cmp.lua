return {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "onsails/lspkind.nvim"
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      mapping = {
["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local before_cursor = line:sub(1, col)

    local is_astro_component =
      vim.bo.filetype == "astro"
      and before_cursor:match("<[%u][%w_]*$")

    cmp.confirm({ select = true })

    if is_astro_component then
      vim.schedule(function()
        local row, current_col = unpack(vim.api.nvim_win_get_cursor(0))

        vim.api.nvim_buf_set_text(
          0,
          row - 1,
          current_col,
          row - 1,
          current_col,
          { " />" }
        )

        -- スペースの後、/> の直前にカーソルを置く
        vim.api.nvim_win_set_cursor(0, { row, current_col + 1 })
      end)
    end
  elseif luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
      },
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
        {
          name = "buffer",
          option = {
            get_bufnrs = function()
              return { vim.api.nvim_get_current_buf() }
            end,
            keyword_length = 4,
          },
          entry_filter = function(entry, ctx)
            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            row = row - 1
            local tsnode = vim.treesitter.get_node({ bufnr = ctx.bufnr, pos = { row, col } })

            if not tsnode then
              return true
            end

            local parent = tsnode:parent()
            if not parent then
              return true
            end

            local func_types = { "function_definition", "function_declaration" }
            return vim.tbl_contains(func_types, parent:type())
          end,
        },
        { name = "path" },
      },
    })

    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
      }, {
        { name = "cmdline" }
      }),
      matching = { disallow_symbol_nonprefix_matching = false },
      view = {
        entries = { name = "custom", separator = " | " }
      },
    })

    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
      view = {
        entries = { name = "custom", separator = " | " }
      },
    })
  end,
}
