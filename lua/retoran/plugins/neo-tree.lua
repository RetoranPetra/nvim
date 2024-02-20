return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim"
	},
	init = function ()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		-- TODO: Figure out what's going on when you use :e to open a file.
		-- neo-tree doesn't seem to follow the selection
		-- TODO: Figure out how to make an opened buffer get selected in neotree.
		hide_root_node = true,
		open_files_do_not_replace_types = {},
	},
	enabled = vim.g.neotree,
}
