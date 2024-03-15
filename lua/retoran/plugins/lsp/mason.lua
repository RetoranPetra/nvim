return {

	-- NOTE: Would be nice to have all the "Ensure installed"
	--			handled by a centralised file organised by filetype.
	--			Could instead possibly have a centralised file for
	--			all language specific configuration, that then passes
	--			through the arguments to the relevant handler such as
	--			mason, mason-tool-installer, lspconfig, conform, nvim-dap etc.

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			automatic_installation = false,
			ensure_installed = {
				"lua_ls",
				"omnisharp",
				"clangd",
				"rust_analyzer",
				"marksman",
				"gopls",
				"pylsp",
				"bashls",
				-- TODO: Try making a lemminx plugin that works with xaml.
				"lemminx",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				-- Treesitter
				"tree-sitter-cli",
				-- # Formatters
				"gofumpt",
				"stylua",
				"csharpier",
				-- Clang format depreciated
				--"clang-format",
				-- Contains more than just formatter
				"cmakelang",
				"beautysh",
				"mdformat",
			},
			auto_update = true,
			run_on_start = true,
			debounce_hours = 12,
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
