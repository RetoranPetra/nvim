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
	-- TODO: Name the prefixes after leader
	opts = {
	},
}
