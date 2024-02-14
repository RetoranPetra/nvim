return {
	"nvim-treesitter/nvim-treesitter",
	opts = {
		auto_install = true,
		highlight = { enable = true},
		indent = { enable = true }
	},
	build = function ()
		require("nvim-treesitter.install").update({ with_sync = true })()
	end,
	config = function(_,opts)
		local configs = require("nvim-treesitter.configs")
		configs.setup(opts)
	end,
	event = "bufEnter"
}
