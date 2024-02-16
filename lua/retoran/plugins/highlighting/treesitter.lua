return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function (_,opts)
			--opts.indent = { enable = true }
			--opts.highlight = { enable = true }
			opts.auto_install = true
			opts.ensure_installed = {
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
				}
			opts.sync_install = true
		end,
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
