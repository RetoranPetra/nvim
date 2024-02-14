local map = vim.keymap.set

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Buffer Navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
-- TODO: Add Ctrl+Shift+c and Ctrl+Shift+v missing bindings

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
		-- Go to declaration gD
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, temp)
		-- Go to definition gd
		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, temp)
		-- Show documentation in hover K
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, temp)
		-- Go to implementation gi
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, temp)
		-- signature help control+k
		vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, temp)
		-- Add workspace folder <space>wa
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, temp)
		-- Remove workspace folder <space>wr
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, temp)
		-- List workspace folders <space>wl
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, temp)
		-- Type definition <space>D
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, temp)
		-- RENAME, IMPORTANT. <space>rn
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, temp)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, temp)
		-- Go through references. gr
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, temp)
		-- Format buffer <space>f
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, temp)
	end,
})
-- List of bindings set in other places by plugins
--[[

	LazyGit
	<space>gg Open LazyGit
	
	Telescope
	<leader>ff Find Files
	<leader>fg Find with grep
	<leader>fb find buffer
	<leader>fh find help tags
--]]
