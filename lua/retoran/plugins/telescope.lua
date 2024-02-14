-- change some telescope options and a keymap to browse plugin files
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
			end,
		},
		{ "nvim-lua/plenary.nvim" },
	},
}
