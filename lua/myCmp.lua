local myCmp = {}


local luasnip = require("luasnip")
local cmp = require("cmp")
local select_opts = {behavior = cmp.SelectBehavior.Select}

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
			end
		},
		window = {
			--completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = {
			['<Up>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Select},
			['<Down>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Select},

			['<C-p>'] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
			['<C-n>'] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},

			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),

			['<C-e>'] = cmp.mapping.abort(),
			--['<C-y>'] = cmp.mapping.confirm({select = true}),
			['<CR>'] = cmp.mapping.confirm({select = false}),

			['<C-f>'] = cmp.mapping(function(fallback)
			  if luasnip.jumpable(1) then
				luasnip.jump(1)
			  else
				fallback()
			  end
			end, {'i', 's'}),

			['<C-b>'] = cmp.mapping(function(fallback)
			  if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			  else
				fallback()
			  end
			end, {'i', 's'}),

			['<Tab>'] = cmp.mapping(function(fallback)
			  local col = vim.fn.col('.') - 1

			  if cmp.visible() then
				cmp.select_next_item {behavior = cmp.SelectBehavior.Insert}
			  elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			  else
				cmp.complete()
			  end
			end, {'i', 's'}),

			['<S-Tab>'] = cmp.mapping(function(fallback)
			  if cmp.visible() then
				cmp.select_prev_item {behavior = cmp.SelectBehavior.Insert}
			  else
				fallback()
			  end
			end, {'i', 's'}),
		  },
  --[[
		mapping = cmp.mapping.preset.insert({
			-- Simple mappings
			['<C-j>'] = cmp.mapping.select_next_item(select_opts),
			['<C-k>'] = cmp.mapping.select_prev_item(select_opts),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-d>'] = cmp.mapping.scroll_docs(-4),
			['<C-e>'] = cmp.mapping.abort(),
			-- Advanced Mappings
			['<Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item(select_opts)
					-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable() 
					-- they way you will only jump inside the snippet region
					print("Visible!")
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
					print("Lua-snippable")
				elseif has_words_before() then
					cmp.complete()
					print("Has words before!")
				else
					fallback()
					print("Gave up, used default")
				end
			end, { "i", "s" }),

			['<S-Tab>'] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item(select_opts)
					print("Visible!")
				elseif luasnip.jumpable(-1) then
					luasnip.jump(-1)
					print("Lua-snippable")
				else
					fallback()
					print("Gave up, used default")
				end
			end, { "i", "s" }),
			['<CR>'] = cmp.mapping({
				i = function(fallback)
					if cmp.visible() and cmp.get_active_entry() then
						cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
						print("Visible, attempting insert")
					else
						fallback()
						print("Not visible, not attempting insert")
					end
				end,
				s = cmp.mapping.confirm({ select = true }),
				c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			}),
		}),
--]]

		sources = cmp.config.sources(
			-- Order of priority of sources
			-- Group 1, don't show lower group unless exhausted.
			{
				{ name = "nvim_lsp"},
				{ name = "luasnip" },
			},
			-- Group 2, etc.
			{
				{ name = "buffer" },
			},
			{
				{ name = "path" },
			}
		),
		-- Define how the menu is displayed
		formatting = {
			fields = {'menu','abbr','kind'},
			format = function(entry, item)
				local menu_icon = {
					nvim_lsp = 'λ',
					luasnip = '⋗',
					buffer = 'Ω',
					path = '🖫'
				}
				item.menu = menu_icon[entry.source.name]
				return item
			end,
		}

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
	local lspconfig = require('lspconfig')
	local lsp_defaults = lspconfig.util.default_config

	lsp_defaults.capabilities = vim.tbl_deep_extend(
	  'force',
	  lsp_defaults.capabilities,
	  require('cmp_nvim_lsp').default_capabilities()
	)
	--local capabilities = require('cmp_nvim_lsp').default_capabilities()
	local servers = {
		'clangd','rust_analyzer','pylsp','cmake',
		'texlab','jsonls','lua_ls','vimls'
	}
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = lsp_defaults.capabilities
			--on_attach = function(client,bufnr) vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') end
		})
	end
end

local function myLuaSnip()
	--[[
	luasnip.config.set_config {
		updateevents = "TextChanged,TextChangedI",
		history = true
	}
	--]]
	require('luasnip.loaders.from_vscode').lazy_load()
end

function myCmp.setup()
	myCmpSetup()
	myFileTypes()
	myCmdLine()
	myLsp()
	myLuaSnip()
end

return myCmp
