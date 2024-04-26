return {
	{ "L3MON4D3/LuaSnip", config = true },
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"f3fora/cmp-spell",
			"L3MON4D3/LuaSnip",
			{ "hrsh7th/cmp-nvim-lsp", dependencies = "neovim/nvim-lspconfig" },
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			{ "saadparwaiz1/cmp_luasnip", dependencies = "L3MON4D3/LuaSnip" },
			"onsails/lspkind.nvim",
		},
		lazy = false,
		opts = function(_, opts)
			local has_words_before = function()
				unpack = unpack or table.unpack
				local line, col = unpack(vim.api.nvim_win_get_cursor(0))
				return col ~= 0
					and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
			end

			local luasnip = require("luasnip")
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			opts.snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			}
			opts.formatting = {
				format = lspkind.cmp_format({
					mode = "symbol",
				}),
			}
			opts.sources = cmp.config.sources({
				{ name = "luasnip", priority = 2 },
				{ name = "nvim_lsp", priority = 1 },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			})
			opts.completion = {
				completeopt = "menu,menuone,noinsert,noselect",
			}
--			opts.sorting = {
--				comparators = {
--					cmp.config.compare.exact,
--					cmp.config.compare.offset,
--					cmp.config.compare.recently_used,
--				},
--			}
			opts.mapping = {
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
						-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
						-- that way you will only jump inside the snippet region
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
							fallback()
						end
					end,
					s = cmp.mapping.confirm({ select = true }),
					--c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
					c = function(fallback)
						if cmp.visible() and cmp.get_active_entry() then
							cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						else
							fallback()
						end
					end,
				}),
			}
		end,
		-- Can't tell if this is working but it seems to be?
		config = function(_, opts)
			local cmp = require("cmp")
			cmp.setup(opts)
			-- Setup for specific types and such inherit from initial setup.
			-- TODO: Figure out why tab completion is different to the completion that pops up in the command line window.
			cmp.setup.cmdline(":", {
				mapping = opts.mapping,
				sources = {
					{ name = "cmdline" },
				},
			})
			-- Add one for bash completion for "!" type
			-- One for lua completion for "lua" type

			-- Filetype setup
			cmp.setup.filetype({ "markdown", "txt" }, {
				sources = {
					{ name = "nvim_lsp" },
					{ name = "spell" },
					{ name = "path" },
				},
			})
		end,
	},
}
