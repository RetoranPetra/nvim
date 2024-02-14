return {
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim",
		opts = {
			automatic_installation = false
		}
	},
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"lua-language-server",
				"omnisharp",
				"clangd",
				"rust-analyzer",
				"tree-sitter-cli"
			},
			auto_update = true,
			run_on_start = true,
			debounce_hours = 12
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
