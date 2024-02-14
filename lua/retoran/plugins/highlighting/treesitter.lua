return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			highlight = { enable = true },
			indent = { enable = true },
			cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
			auto_install = true,
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"regex",
				"bash",
				"markdown",
				"markdown_inline",
				"gitcommit",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitignore",
				"cmake",
				"make",
				"luadoc",
				-- Install hyprlang with TSInstall after treesitter has initialised.
				--"hyprlang"

				-- TODO: Should automatically install hyprlang somehow.
			},
			-- Don't install all at once, better for windows.
			sync_install = true
		},
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function(_, opts)
			local configs = require("nvim-treesitter.configs")
			configs.setup(opts)
		end,
		lazy = false
	},
	{
		"luckasRanarison/tree-sitter-hyprlang",
		dependencies = { "nvim-treesitter/nvim-treesitter" }
	}
}
