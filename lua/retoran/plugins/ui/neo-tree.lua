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
	},
	enabled = vim.g.neotree,
}
