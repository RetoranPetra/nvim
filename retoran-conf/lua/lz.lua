require("lz.n").load {
	{
		"nightfly",
		lazy = false,
		priority = 1000,
		after = function()
			vim.g.nightflyTransparent = true
			vim.g.nightflyCursorcolor = true
			vim.g.nightflyItalics = true
			vim.cmd([[colorscheme nightfly]])
		end,
	},
	{
		"neo-tree.nvim",
		beforeall = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1
		end,
		before = function()
			local lz = require('lz.n')
			lz.trigger_load('nui.line')
			lz.trigger_load('plenary.nvim')
			lz.trigger_load('nvim-web-devicons')
		end,
		after = function()
			local neotree = require("neo-tree")
			neotree.setup({
				hide_root_node = true,
				open_files_do_not_replace_types = {},
				filesystem = {
					cwd_target = {
						current = "global",
					},
					follow_current_file = {
						enabled = true,
						leave_dirs_open = false,
					},
					hijack_netrw_behaviour = "open_default",
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
			});
			vim.keymap.set("n", "<leader>z", [[:Neotree buffers position=float<CR>]], {
				silent = true,
				desc = "Neotree buffers"
			})
			vim.keymap.set("n", "<leader>x", [[:Neotree toggle position=float<CR>]], {
				silent = true,
				desc = "Neotree"
			})
		end,
		lazy = false,
		enabled = false,
	},
}
