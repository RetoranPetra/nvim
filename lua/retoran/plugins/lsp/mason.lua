return {
	-- Would be nice to have this handled by an auto installer per langauge.
	-- I.E. a set of default tools I want per language and then install them only
	-- when opening said file type.
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
				"clang-format",
				-- Contains more than just formatter
				"cmakelang",
				"beautysh",
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
