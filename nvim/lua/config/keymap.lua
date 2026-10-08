local map = vim.keymap.set
local def_opts = { noremap = true, silent = true }

-- barbar --
map("n", "<A-h>", "<cmd>BufferPrevious<cr>", def_opts)
map("n", "<A-l>", "<cmd>BufferNext<cr>", def_opts)

map("n", "<A-w>", "<cmd>BufferClose<cr>", def_opts)

map("n", "<leader>bb", "<cmd>BufferOrderByBufferNumber<cr>", def_opts)
map("n", "<leader>bn", "<cmd>BufferOrderByName<cr>", def_opts)
map("n", "<leader>bd", "<cmd>BufferOrderByDirectory<cr>", def_opts)
map("n", "<leader>bl", "<cmd>BufferOrderByLanguage<cr>", def_opts)
map("n", "<leader>bw", "<cmd>BufferOrderByWindowNumber<cr>", def_opts)

-- neo-tree --
map("n", "<C-n>", "<cmd>Neotree toggle left<cr>", { silent = true })

-- trouble --
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics" })
map("n", "<leader>xX", "<cmd>Trouble diagnostics filter.buf=0<cr>", { desc = "Buffer Diagnostic" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>cl",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
map("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- Telescope --
map("n", "<Leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
map("n", "<Leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
map("n", "<Leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
map("n", "<Leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })

map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Lazygit
map("n", "<leader>lg", "<cmd>LazyGit<cr>", { desc = "Lazygit" })

-- Template --
map("n", "<Leader>t", function()
	vim.fn.feedkeys(":Template ")
end, { remap = true })
