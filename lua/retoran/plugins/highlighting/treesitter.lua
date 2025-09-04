return {
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if vim.g.os == "Linux" or vim.g.mingw64 == true then
				opts.indent = { enable = true }
				opts.highlight = { enable = true }
				opts.auto_install = true
				opts.ensure_installed = { }
			end
			opts.sync_install = true
		end,
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function(_, opts)
			if vim.g.os == "Windows_NT" then
				require("nvim-treesitter.install").compilers = { "clang" }
			end
			local configs = require("nvim-treesitter.configs")
			configs.setup(opts)
		end,
		lazy = false,
	},
	{
		"luckasRanarison/tree-sitter-hyprlang",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}
