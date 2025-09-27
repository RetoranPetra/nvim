return {
	"nightfly",
	lazy = false,
	priority = 1000,
	after = function()
		vim.g.nightflyTransparent = true
		vim.g.nightflyCursorcolor = true
		vim.g.nightflyItalics = true
		vim.cmd([[colorscheme nightfly]])
	end,
}
