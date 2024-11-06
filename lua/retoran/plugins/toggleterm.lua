return {
	{
		"akinsho/toggleterm.nvim",
		opts = {
			shade_terminals = false,
			insert_mappings = false,
			terminal_mappings = false,
			open_mapping = "<leader>t",
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
					-- HACK: Workaround for not msys2 lazygit not working properly with zsh -s command.
					--       Instead we can enter lazygit command manually, and exit with control-q instead of q.
					vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<CR>",{
						noremap = true,
						silent = true,
					})
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
				"<leader>s",
				"<cmd>lua _FloatTerm_toggle()<CR>",
				{ silent = true, desc = "Toggle FloatTerm" }
			)

			-- Regular binds
			vim.api.nvim_set_keymap("n", "<leader>ft", ":TermSelect<CR>", { silent = true, desc = "Find ToggleTerms" })
		end,
	},
}
