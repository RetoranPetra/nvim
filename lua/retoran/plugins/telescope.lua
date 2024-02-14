-- change some telescope options and a keymap to browse plugin files
return {
	"nvim-telescope/telescope.nvim",
	opts = {},
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
			config = function()
				require("telescope").load_extension("fzf")
				local builtin = require('telescope.builtin')
				vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
				vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
				vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
				vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
			end,
		},
		{ "nvim-lua/plenary.nvim" },
	},
}
