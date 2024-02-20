-- change some telescope options and a keymap to browse plugin files
return {
	-- TODO: Add todo telescope.
	-- TODO: Add git grep telescope.
	"nvim-telescope/telescope.nvim",
	opts = {},
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build =
			'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
			config = function()
				require("telescope").load_extension("fzf")
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[F]ind [F]iles" })
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "[F]ind [G]rep" })
				vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[F]ind [B]uffer" })
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[F]ind [H]elp" })
			end,
		},
		{ "nvim-lua/plenary.nvim" },
	},
}
