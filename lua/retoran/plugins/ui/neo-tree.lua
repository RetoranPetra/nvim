return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	-- TODO: Add keybind for toggling Neotree.
	opts = {
		hide_root_node = true,
		open_files_do_not_replace_types = {},
		filesystem = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
			hijack_netrw_behaviour = "open_default",
			-- Try to use OS level file watchers instead of autcmds.
			use_libuv_file_watcher = true,
		},
		buffers = {
			follow_current_file = {
				enabled = true,
				leave_dirs_open = false,
			},
		},
		window = {
			position = "current",
		},
	},
	config = function(_, opts)
		local neotree = require("neo-tree")
		neotree.setup(opts)

		vim.keymap.set("n", "<leader>z", [[:Neotree buffers position=float<CR>]], { silent = true })
		vim.keymap.set("n", "<leader>x", [[:Neotree toggle position=float<CR>]], { silent = true })
	end,
	enabled = true,
}
