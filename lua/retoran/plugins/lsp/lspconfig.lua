return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		dependencies = "williamboman/mason.nvim"
	},
	event = "BufEnter",
	opts = {
		lua_ls = {
			settings = {
				Lua = {
					runtime = { version = "LuaJIT" },
					diagnostics = {
						globals = {
							"vim",
							"require"
						},
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true)
					},
					telemetry = { enable = false },
				},
			},
		},
	},
	config = function(_, opts)
		-- Enable keybindings

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local temp = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, temp)
				vim.keymap.set('n', 'gd', vim.lsp.buf.definition, temp)
				vim.keymap.set('n', 'K', vim.lsp.buf.hover, temp)
				vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, temp)
				vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, temp)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, temp)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, temp)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, temp)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, temp)
				vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, temp)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, temp)
				vim.keymap.set('n', 'gr', vim.lsp.buf.references, temp)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, temp)
			end,
		})

		-- Use masonlspconfig to automatically setup our servers.
		-- See :h mason-lspconfig-automatic-server-setup
		require("mason-lspconfig").setup_handlers {
			-- The first entry (without a key) will be the default handler
			-- and will be called for each installed server that doesn't have
			-- a dedicated handler.
			function(server_name)    -- default handler (optional)
				require("lspconfig")[server_name].setup {}
			end,
			["lua_ls"] = function()
				require("lspconfig")["lua_ls"].setup(opts.lua_ls)
			end
		}
	end
}
