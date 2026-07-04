return {
  "numToStr/Comment.nvim",
  event = { "BufNewFile", "BufReadPre" },
  
  config = function()
    require("extensions.Comment")
  end,
}
