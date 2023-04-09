local myCmp = {}


local luasnip = require("luasnip")
local cmp = require("cmp")
local lspconfig = require("lspconfig")

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local function myCmpSetup()
	cmp.setup({

		snippet = {
			--MUST SPECIFY SNIPPET ENGINE
			expand = function(args)
				require('luasnip').lsp_expand(args.body)
			end,
		},
		--No clue what these do, enabling one anyway.
		window = {
			-- completion = cmp.config.window.bordered(),
			-- documentation = cmp.config.window.bordered(),
		},

		-- ... Your other configuration ...

		mapping = cmp.mapping.preset.insert({
			-- Advanced Mappings
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
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
			["<C-e>"] = cmp.mapping.abort(),
			["<CR>"] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
					else
						fallback()
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),
		}),

		sources = cmp.config.sources(
			{ name = "nvim_lsp"},
			{ name = "luasnip"},
			-- My stuff
			{ name = "buffer" }
		),

	  -- ... Your other configuration ...
	})
end
local function myFileTypes()
	-- Set config for filetype
	--[[
	cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
	  { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
	  { name = 'buffer' },
	})
	})
	--]]
end
local function myCmdLine()
	-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources =
		{
			{ name = 'buffer' }
		}
	})

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources(
			{
		  { name = 'path' }
			},
			{
		  { name = 'cmdline' }
			}
		)
	})
end

local function myLsp()
	-- Set up lspconfig.
	local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local servers = {
		'clangd','rust_analyzer','pylsp','cmake',
		'texlab','jsonls','lua_ls','vimls'
	}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup {
			capabilities = capabilities
		}
	end
	--[[
	require('lspconfig')['clangd'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['rust_analyzer'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['pylsp'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['bashls'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['cmake'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['texlab'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['jsonls'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['lua_ls'].setup {
	capabilities = capabilities
	}
	require('lspconfig')['vimls'].setup {
	capabilities = capabilities
	}
	--]]
end

local function myLuaSnip()
	luasnip.config.set_config {
		updateevents = "TextChanged,TextChangedI",
		history = true
	}
end

function myCmp.setup()
	myCmpSetup()
	myFileTypes()
	myCmdLine()
	myLsp()
	myLuaSnip()
end

return myCmp
