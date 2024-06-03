return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			shade_terminals = false,
			-- TODO: Put in issue for this to only work in terminal/normal/whatever mode.
			--       Feels very weird for it to work globally, can't use leader as it interferes with every space press.
			open_mapping = "<C-\\>",
			on_open = function(term)
				if term.is_float(term) then
					vim.cmd("startinsert!")
				end
				vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {
					silent = true,
				})
			end,
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
			local floatTerm = terminal:new({
				hidden = true,
				direction = "float",
				on_open = function(term)
					opts.on_open(term)
				end,
			})
			-- Global
			function _Lazygit_toggle()
				lazygit:toggle()
			end
			function _FloatTerm_toggle()
				floatTerm:toggle()
			end

			vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua _Lazygit_toggle()<CR>", {
				noremap = true,
				silent = true,
				desc = "Toggle Lazygit",
			})
			vim.api.nvim_set_keymap(
				"n",
				"<leader>t",
				"<cmd>lua _FloatTerm_toggle()<CR>",
				{ silent = true, desc = "Toggle FloatTerm" }
			)

			-- Regular binds
			vim.api.nvim_set_keymap("n", "<leader>ft", ":TermSelect<CR>", { silent = true, desc = "Find ToggleTerms" })
			vim.api.nvim_set_keymap(
				"n",
				"<leader>z",
				":ToggleTermToggleAll<CR>",
				{ silent = true, desc = "Open ToggleTerm" }
			)
		end,
	},
}
