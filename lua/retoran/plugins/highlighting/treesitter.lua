return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
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
			"luadoc"
		},
		indent = { enable = true },
		-- Don't install all at once, better for windows.
		sync_install = true
	},
	build = function ()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function(_,opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
	lazy = false
}
