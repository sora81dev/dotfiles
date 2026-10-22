require("nvim-treesitter").install({
	"astro",
	"c",
	"cpp",
	"devicetree",
	"html",
	"rust",
	"svelte",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"latex",
	"tsx",
	"typescript",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"astro",
		"c",
		"cpp",
		"dts",
		"html",
		"rust",
		"svelte",
		"lua",
		"markdown",
		"nix",
		"latex",
		"typescript",
		"typescriptreact",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
