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
	config = function(_,opts)
		require("nvim-tree").setup(opts)
		-- Opens neotree on startup no matter what.
		require("nvim-tree.api").tree.open()
		 -- Ideally want to keep focus on our buffer when we open neo tree, so probably want to change this.
	end,
	event = "VimEnter"
}
