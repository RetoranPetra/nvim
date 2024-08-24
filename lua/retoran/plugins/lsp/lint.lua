return {
	"mfussenegger/nvim-lint",
	config = function()
		local lint = require("lint")
		lint.linters_by_ft = {
			-- NOTE: Bacon is not supported by nvim-lint.
			--       use nvim-bacon if you really want it.
			--       Probably best not to use it as it operates completely differently to other lsps.

			-- NOTE: These may or may not be real filetypes. Need to check.
			cmake = { "cmakelint" },
			bash = { "shellcheck" },
			sh = { "shellcheck" },
		}
		vim.api.nvim_create_autocmd({ "BufWritePost" }, {
			callback = function()
				-- Run configured linter for filetype.
				lint.try_lint()
			end,
		})
	end,
}
