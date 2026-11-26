require("nvim-treesitter").install({
	"astro",
	"c",
	"cpp",
	"devicetree",
	"go",
	"html",
	"kotlin",
	"rust",
	"svelte",
	"lua",
	"markdown",
	"markdown_inline",
	"nix",
	"latex",
	"tsx",
	"typst",
	"typescript",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"astro",
		"c",
		"cpp",
		"dts",
		"go",
		"kotlin",
		"html",
		"rust",
		"svelte",
		"lua",
		"markdown",
		"nix",
		"latex",
		"typescript",
		"typescriptreact",
		"typst",
	},
	callback = function()
		vim.treesitter.start()
	end,
})
