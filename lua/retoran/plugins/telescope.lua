-- change some telescope options and a keymap to browse plugin files
return {
	-- TODO: Add todo telescope.
	-- TODO: Add git grep telescope.
	"nvim-telescope/telescope.nvim",
	opts = {
	},
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Find Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
	end,
}
