return {
    'nvim-telescope/telescope.nvim', version = '*',
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = {
     defaults = {
      layout_config = {
        width = 0.75,
      },
      file_ignore_patterns = {
        "%.git/",
        "%.metadata/",
      },
      mappings = {},
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
  }
}
