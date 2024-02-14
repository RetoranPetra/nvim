return {
	{
		"neovim/nvim-lspconfig",
		opts = {},
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			opts = {
				automatic_installation = true
			},
			dependencies = {
				{
					"williamboman/mason.nvim",
					opts = {}
				}
			}
		}
	}
}
