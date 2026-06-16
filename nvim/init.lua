-- COL NUMBER --
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- File Settings --
vim.opt.fileencoding = "utf-8"

-- Tab Spaces --
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- Disable netrw --
vim.api.nvim_set_var('loaded_netrw', 1)
vim.api.nvim_set_var('loaded_netrwPlugin', 1)

-- Leader Key --
vim.g.mapleader = " "

-- Diagnostic --
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = true,
  },
  float = {
    source = true,
    border = "rounded",
  },
})

-- Trouble --
vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  callback = function()
    vim.cmd([[Trouble qflist open]])
  end,
})

vim.filetype.add({
  extension = {
    tsx = "typescriptreact",
  }
})

vim.o.background = 'light'

vim.g.edge_ename_italic = true
vim.g.edge_style = 'aura'
vim.g.edge_float_style = 'blend'
vim.g.diagnostic_line_highlight = 1
vim.g.edge_colors_override = {
  bg0 = { '#f2f2f2', '255' }
}

require("config.autopairs")
require("config.lazy")
require("config.keymap")
require("config.lsp")
require("config.lualine")
require("config.neo-tree")
require("config.nvim-cmp")
require("config.nvim-highlight-colors")
require("config.ts-autotag")

-- Fix Hilight --
vim.api.nvim_set_hl(0, "@tag.tsx", { link = "Tag" })
vim.api.nvim_set_hl(0, "@tag.delimiter.tsx", { link = "Delimiter" })
vim.api.nvim_set_hl(0, "@constructor.tsx", { link = "Function" })
vim.api.nvim_set_hl(0, "@keyword.tsx", { link = "Keyword" })
