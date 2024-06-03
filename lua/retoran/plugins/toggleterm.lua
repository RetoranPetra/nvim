return {
	{
		"akinsho/toggleterm.nvim",
		opts = {},
		config = function(_, opts)
			local toggleterm = require("toggleterm")
			local terminal = require("toggleterm.terminal").Terminal
			toggleterm.setup(opts)

			-- Custom terminals
			local lazygit = terminal:new({
				cmd = "lazygit",
				dir = "git_dir",
				hidden = true,
				direction = "float",
				on_open = function(term)
					vim.cmd("startinsert!")
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"q",
						"<cmd>close<CR>",
						{ noremap = true, silent = true }
					)
					vim.api.nvim_buf_set_keymap(
						term.bufnr,
						"n",
						"<esc>",
						"<cmd>lua _Lazygit_toggle()<CR>",
						{ noremap = true, silent = true }
					)
				end,
			})
			-- Global
			function _Lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap(
				"n",
				"<leader>g",
				"<cmd>lua _Lazygit_toggle()<CR>",
				{ noremap = true, silent = true }
			)
		end,
	},
}
