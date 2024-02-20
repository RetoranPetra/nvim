return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons"
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
	},
	-- Takes opts from above.
	config = function(_, opts)
		require("nvim-tree").setup(opts)
		require("nvim-tree.api").tree.toggle({ focus = false, find_file = true })
	end,
	event = "VimEnter"
}
