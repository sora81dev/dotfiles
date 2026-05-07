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
      mappings = {
        i = {
          ["<C-q>"] = require('telescope.actions').send_to_qflist 
          + require('telescope.actions').open_qflist,
        },
        n = {
          ["<C-q>"] = require('telescope.actions').send_to_qflist 
          + require('telescope.actions').open_qflist,
        },
      }
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
}
