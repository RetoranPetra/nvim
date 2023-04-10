local M = {}

local luasnip = require('luasnip')
local cmp = require('cmp')
--Binding options
local optSelect = {behavior = cmp.SelectBehavior.Select}
local optInsert = {behavior = cmp.SelectBehavior.Insert}

local function mainSetup()
	cmp.setup({
		--START
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end
		},
		mapping = cmp.mapping.preset.insert({
			['<C-j>'] = cmp.mapping.select_next_item(optSelect),
			['<C-k>'] = cmp.mapping.select_prev_item(optSelect),
			['<CR>'] = cmp.mapping.confirm({select=true}),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
		}),
		sources = cmp.config.sources(
		{
			{ name = 'nvim-lsp' },
			{ name = 'luasnip'}
		},
		{
			{ name = 'buffer' }
		},
		{
			{ name = 'path'}
		}
		),
		--END
	})
end

local function cmdLine()
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

function M.setup()
	mainSetup()
	cmdLine()
end

return M
