return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		-- Override timeout for whichkey
		-- Whichkey only appears when you don't type anything for timeoutlen.
		-- Overrides basic behaviour of these which normally just causes keybind to reset.
		vim.o.timeout = true
		vim.o.timeoutlen = 600
	end,
	opts = {},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		wk.register({
			f = {
				name = "[F]ind",
			},
			g = {
				name = "[G]it",
			},
			c = {
				name = "[C]ode",
			},
			w = {
				name = "[W]orkspace",
			},
			t = "ToggleTerm"
		}, {
			prefix = "<leader>",
		})
	end,
}
