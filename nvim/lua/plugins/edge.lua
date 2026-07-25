return {
  'sainnhe/edge',
  lazy = false,
  priority = 1000,
  config = function()
    -- Optionally configure and load the colorscheme
    -- directly inside the plugin declaration.
    vim.g.edge_ename_italic = true
    vim.g.edge_style = 'aura'
    vim.g.edge_float_style = 'blend'
    vim.g.edge_dim_inactive_windows = 1

    vim.cmd([[colorscheme edge]])
  end
}
