return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false

		require("barbar").setup({
			sidebar_filetypes = {
				NvimTree = true,

				["neo-tree"] = { event = "BufWipeout" },
			},
		})
	end,
	version = "^1.0.0",
}
