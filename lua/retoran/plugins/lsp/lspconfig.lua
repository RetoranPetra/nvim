return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"Hoffs/omnisharp-extended-lsp.nvim",
		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = "williamboman/mason.nvim",
		},
		{ "folke/neodev.nvim" },
	},
	event = "BufEnter",
	opts = function(_, opts)
		-- # lua_ls
		opts.lua_ls = {
			settings = {
				Lua = {
					telemetry = { enable = false },
				},
			},
		}

		-- # Omnisharp
		local path
		if vim.g.os == "Linux" then
			path = vim.fn.stdpath("data") .. "/mason/bin/omnisharp"
		elseif vim.g.os == "Windows_NT" or vim.g.os == "MINGW32_NT-10.0" then
			path = vim.fn.stdpath("data") .. "\\mason\\bin\\omnisharp.cmd"
		end
		opts.omnisharp = {
			cmd = {
				path,
				"--languageserver",
				"--hostPID",
				tostring(vim.fn.getpid()),
			},
			-- May want to enable these at some point
			enable_import_completion = false,
			-- Enable this for omnisharp_extended.
			enable_rosyln_analyzers = true,
			-- TODO: Double check if this is working correctly, getting a lot of errors on windows.
			handlers = {
				["textDocument/definition"] = require("omnisharp_extended").definition_handler,
				["textDocument/references"] = require("omnisharp_extended").references_handler,
				["textDocument/implementation"] = require("omnisharp_extended").implementation_handler,
			},
		}
		opts.lemminx = {
			filetypes = { "xml", "xsd", "xsl", "xslt", "svg", "xaml" },
		}
	end,
	config = function(_, opts)
		-- Use masonlspconfig to automatically setup our servers.
		-- See :h mason-lspconfig-automatic-server-setup
		local lspconf = require("lspconfig")
		require("mason-lspconfig").setup_handlers({
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name) -- default handler (optional)
				lspconf[server_name].setup({})
			end,
			["lua_ls"] = function()
				require("neodev").setup({})
				lspconf["lua_ls"].setup(opts.lua_ls)
			end,
			["omnisharp"] = function()
				lspconf["omnisharp"].setup(opts.omnisharp)
			end,
			["lemminx"] = function ()
				lspconf["lemminx"].setup(opts.lemminx)
			end
		})
	end,
}
