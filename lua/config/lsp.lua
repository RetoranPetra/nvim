local M = {}

local servers = {
	'clangd','rust_analyzer','pylsp','cmake',
	'texlab','jsonls','lua_ls','vimls'
}
local lspconfig = require('lspconfig')
local cmp_lsp = require('cmp_nvim_lsp')

local function serverSetup()
	require("neodev").setup({})
	--Set up default capabilities
	local lsp_defaults = lspconfig.util.default_config
	lsp_defaults.capabilities = vim.tbl_deep_extend(
	  'force',
	  lsp_defaults.capabilities,
	  cmp_lsp.default_capabilities()
	)
	for _, lsp in ipairs(servers) do
		lspconfig[lsp].setup({
			capabilities = lsp_defaults.capabilities
			--on_attach = function(client,bufnr) vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') end
		})
	end
end

local function lspAutoCmd()
	vim.api.nvim_create_autocmd('LspAttach', {
	  desc = 'LSP actions',
	  callback = function()
		-- fuck it, add that shit to the omnifunc buffer. This shouldn't work.
		--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
		-- If this doesn't work, it will remain as a mark of shame forever.
		local bufmap = function(mode, lhs, rhs)
		  local opts = {buffer = true}
		  vim.keymap.set(mode, lhs, rhs, opts)
		end

		-- Displays hover information about the symbol under the cursor
		bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

		-- Jump to the definition
		bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

		-- Jump to declaration
		bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

		-- Lists all the implementations for the symbol under the cursor
		bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

		-- Jumps to the definition of the type symbol
		bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

		-- Lists all the references 
		bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

		-- Displays a function's signature information
		bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

		-- Renames all references to the symbol under the cursor
		bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

		-- Selects a code action available at the current cursor position
		bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')
		bufmap('x', '<F4>', '<cmd>lua vim.lsp.buf.range_code_action()<cr>')

		-- Show diagnostics in a floating window
		bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

		-- Move to the previous diagnostic
		bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

		-- Move to the next diagnostic
		bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
	  end
	})
end

function M.setup()
	serverSetup()
	lspAutoCmd()
end

return M
