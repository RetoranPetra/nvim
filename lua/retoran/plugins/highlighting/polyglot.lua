return {
	"sheerun/vim-polyglot",
	-- Quick and dirty solution to make polyglot not use parsers intalled by treesitter.
	init = function()
		local parsers = require("nvim-treesitter.info").installed_parsers()
		for i = 1, #parsers do
			parsers[i] = parsers[i] .. ".plugin"
		end
		table.insert(parsers, 1, "sensible")
		vim.g.polyglot_disabled = parsers
	end,
	event = "bufEnter",
	enabled = false
}
