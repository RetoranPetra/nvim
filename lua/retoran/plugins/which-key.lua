return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	dependencies = "echasnovski/mini.icons",
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
		local mini = require("mini.icons")
		wk.setup(opts)

		wk.add({
			{ "<leader>c", group = "Code" },
			{ "<leader>f", group = "Find" },
			{ "<leader>w", group = "Workspace" },
			{ "<leader>r", icon = mini.get("lsp", "String") },
			{ "<leader>T", icon = mini.get("lsp", "Variable") },
			{ "<leader>\\", icon = mini.get("lsp", "Key") },
			{ "<leader>x", icon = mini.get("default", "directory") },
			{ "<leader>z", icon = mini.get("default", "directory") },
			{ "<leader>w", icon = mini.get("directory", "src") },
		})
	end,
}
