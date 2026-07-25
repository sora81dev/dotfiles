local status, npairs = pcall(require, "nvim-autopairs")
if not status then return end

npairs.setup({
  check_ts = true,
})

local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

-- npairs.add_rules({
--   Rule(" ", " ")
--       :with_pair(function(opts)
--         local pair = opts.line:sub(opts.col - 1, opts.col)
--         return vim.tbl_contains({ '><' }, pair)
--       end)
--       :with_move(cond.none())
--       :with_cr(cond.none())
--       :with_del(cond.not_after_text(">"))
-- })

local status_cmp, cmp = pcall(require, "cmp")
if status_cmp then
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

npairs.remove_rule('>')
