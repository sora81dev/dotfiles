local map = vim.keymap.set


-- neo-tree --
map('n', '<C-n>', '<cmd>Neotree toggle left<CR>', { silent = true })

-- trouble --
map('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { desc = 'Diagnostics'})
map('n', '<leader>xX', '<cmd>Trouble diagnostics filter.buf=0<cr>', { desc = 'Buffer Diagnostic'})
map('n', '<leader>cs', "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map('n', '<leader>cl', "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
map('n', '<leader>xL', "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map('n', '<leader>xQ', "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Telescope --
map('n', '<Leader>ff', "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
map('n', '<Leader>fg', "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
map('n', '<Leader>fb', "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
map('n', '<Leader>fh', "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

map('n', '<C-h>', '<C-w>h')
map('n', '<C-l>', '<C-w>l')
