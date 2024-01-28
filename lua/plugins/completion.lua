return {

	{
		"neovim/nvim-lspconfig",
		---@class PluginLspOpts
		opts = {
			---@type lspconfig.options
			servers = {
				-- pyright will be automatically installed with mason and loaded with lspconfig
				pyright = {},
				rust_analyzer = {},
				clangd = {},
				lua_ls = {},
				bashls = {},
				omnisharp = {},
				glsl_analyzer = {},
			},
			autoformat = false,
			-- Fix encoding for clangd
			setup = {
				clangd = function(_, opts)
					opts.capabilities.offsetEncoding = { "utf-16" }
				end,
				omnisharp = function(_, opts)
				end,
			},
		},
	},

	-- Omnisharp definitions support
	-- May need to enable decompilation support in omnisharp settings.
	{"Hoffs/omnisharp-extended-lsp.nvim"},

	-- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
	-- treesitter, mason and typescript.nvim. So instead of the above, you can use:
	{ import = "lazyvim.plugins.extras.lang.typescript" },

	-- use mini.starter instead of alpha
	{ import = "lazyvim.plugins.extras.ui.mini-starter" },

	-- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
	{ import = "lazyvim.plugins.extras.lang.json" },

	-- add any tools you want to have installed below
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"shellcheck",
				"shfmt",
				"flake8",
			},
		},
	},

	-- Use <tab> for completion and snippets (supertab)
	-- first: disable default <tab> and <s-tab> behavior in LuaSnip
	{
		"L3MON4D3/LuaSnip",
		keys = function()
			return {}
		end,
	},

	-- then: setup supertab in cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			--"hrsh7th/cmp-emoji",
			--"FelipeLema/cmp-async-path",
			"f3fora/cmp-spell",
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")

			opts.sources = cmp.config.sources({
				{ name = "luasnip" },
			}, {
				{ name = "nvim_lsp" },
			}, {
				{ name = "buffer" },
				{ name = "spell" },
			}, {
				--{ name = "async_path" },
				{ name = "path" },
			})
			opts.mapping = vim.tbl_extend("force", opts.mapping, {
				-- TODO: Change completion tab/enter bindings to make more sense under my scheme, or just the default basic version.
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if cmp.get_active_entry() then
							cmp.select_next_item()
						else
							cmp.select_next_item({ count = 0 })
						end
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
					-- they way you will only jump inside the snippet region
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<CR>"] = cmp.mapping({
					i = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							cmp.close()
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
				}),
				-- Disable completion on any arrow key press.
				["<Up>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					end
					fallback()
				end, { "i" }),
				["<Down>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					end
					fallback()
				end, { "i" }),
				["<Left>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					end
					fallback()
				end, { "i" }),
				["<Right>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.close()
					end
					fallback()
				end, { "i" }),
			})
		end,
	},
}
