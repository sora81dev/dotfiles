require("template").setup({
  temp_dir = vim.fn.stdpath("config") .. "/template"
})

-- Enable Telescope Integration
require("telescope").load_extension('find_template')
