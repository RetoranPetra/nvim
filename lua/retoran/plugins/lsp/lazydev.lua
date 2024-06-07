return {
	-- NOTE: Unsure if I actually need luvit-meta, seems to just be lua addon.
	{
		"folke/lazydev.nvim",
		dependencies = {
			"Bilal2453/luvit-meta",
		},
		ft = "lua",
		opts = {
			library = {
				{
					path = "luvit-meta/library",
					words = { "vim%.uv" },
				},
			},
			integrations = {
				-- Applies lspconfig fix, no longer make new workspace per buffer.
				lspconfig = true,
				cmp = true,
				coq = false,
			}
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},
}
