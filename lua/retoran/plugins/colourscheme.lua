return {
	{
		"bluz71/vim-nightfly-colors",
		name = "nightfly",
		lazy = false,
		priority = 1000,
		opts = {
			setOnStart = true,
		},
		config = function(_, opts)
			if vim.g.usingGUI == nil then
				vim.g.nightflyTransparent = true
			end
			vim.g.nightflyCursorColor = true
			vim.g.nightflyItalics = true
			if opts.setOnStart then
				vim.cmd([[colorscheme nightfly]])
			end
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {
			setOnStart = false,
		},
		config = function(_, opts)
			if opts.setOnStart then
				vim.cmd([[colorscheme tokyonight]])
			end
		end,
	},
}
