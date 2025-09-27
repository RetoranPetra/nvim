return {
	"nvim-treesitter",
	lazy = false;
	after = function()
		require("nvim-treesitter.configs").setup({
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
			},
			auto_install = false,
		})
	end,
}
