return {
	"bufferline.nvim",
	beforeall = function()
		vim.opt.termguicolors = true
	end,
	after = function()
		require("bufferline").setup()
	end,
	lazy = false,
}
