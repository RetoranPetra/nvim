return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			on_open = function (term)
				vim.cmd("startinsert!")
				vim.api.nvim_buf_set_keymap(term.bufnr,"n","<esc>","<cmd>close<CR>",{
					silent = true,
				})
			end,
			direction = "float",
		},
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
					opts.on_open(term)
					-- overrides terminal rebind of escape.
					vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", {
						noremap = true,
						silent = true,
					})
				end,
				on_close = function(_)
					-- refresh neotree filesystem
					-- Required despite libuv filewatcher due to terminal taking focus it seems?
					require("neo-tree.sources.filesystem.commands").refresh(
						require("neo-tree.sources.manager").get_state("filesystem")
					)
				end,
			})
			-- Global
			function _Lazygit_toggle()
				lazygit:toggle()
			end

			vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", {
				noremap = true,
				silent = true,
				desc = "Toggle Lazygit",
			})
		end,
	},
}
