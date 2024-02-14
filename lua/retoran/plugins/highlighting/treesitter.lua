return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		auto_install = true,
		highlight = { enable = true},
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
