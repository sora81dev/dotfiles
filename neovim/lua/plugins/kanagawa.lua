return {
	"rebelot/kanagawa.nvim",
  enabled = false,
	config=function()
		require('kanagawa').setup({
			compile=true
		});
		vim.cmd("colorscheme kanagawa");
	end,
	build = function ()
		vim.cmd("KanagawaCompile");
	end,
}

