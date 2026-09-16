local group = vim.api.nvim_create_augroup("LspCompletion", {clear = true})

vim.api.nvim_create_autocmd("TextChangedI", {
  pattern = "*.astro",
  callback = function()

    local cmp = require("cmp")

    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local before_cursor = line:sub(1, col)

    local component = before_cursor:match("<([%w_]+)$")

    if component and #component >= 1 and vim.fn.pumvisible() == 0 then
      cmp.complete()
    end
  end,
})

vim.opt.completeopt = {"menu", "menuone", "noselect"}
