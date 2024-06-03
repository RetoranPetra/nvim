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
-- Move to window when in terminal using <ctrl> hjkl
map("t", "<esc>", [[<C-\><c-n>]], { desc = "Escape Terminal" })
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Go to left window", remap = true })
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Go to lower window", remap = true })
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Go to upper window", remap = true })
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Go to right window", remap = true })

-- Buffer Navigation
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- TODO: Get Control + Shift + C maps working.

-- Control + Shift + C bindings, V ones provided by default.
--map("v", "<C-S-c>", 'y')
--map("n", "<C-S-c>", 'yy')

-- Enable keybindings

-- NOTE: Could possibly move all keybindings down here, even ones that rely on plugins
--       Could do this via an autocommand that attaches to when a plugin is loaded?
--       May be better to just place keybinds all over the place and document them
--       using which-key.

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Enable completion triggered by <c-x><c-o>
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {
			buffer = ev.buf,
			desc = "[LSP] Go to declaration",
		})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
			buffer = ev.buf,
			desc = "[LSP] Go to definition",
		})
		vim.keymap.set("n", "K", vim.lsp.buf.hover, {
			buffer = ev.buf,
			desc = "[LSP] Peek documentation",
		})
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {
			buffer = ev.buf,
			desc = "[LSP] Go to implementation",
		})
		vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {
			buffer = ev.buf,
			desc = "[LSP] Peek signature help",
		})
		vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {
			buffer = ev.buf,
			desc = "[LSP] Add workspace folder",
		})
		vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {
			buffer = ev.buf,
			desc = "[LSP] Remove workspace folder",
		})
		vim.keymap.set("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, {
			buffer = ev.buf,
			desc = "[LSP] List workspace folders",
		})
		vim.keymap.set("n", "<leader>T", vim.lsp.buf.type_definition, {
			buffer = ev.buf,
			desc = "[LSP] Peek type definition",
		})
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, {
			buffer = ev.buf,
			desc = "[LSP] Rename",
		})
		vim.keymap.set({ "n", "v" }, "<leader>\\", vim.lsp.buf.code_action, {
			buffer = ev.buf,
			desc = "[LSP] Code Action",
		})
		vim.keymap.set("n", "gr", vim.lsp.buf.references, {
			buffer = ev.buf,
			desc = "[LSP] Go to references",
		})
		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end, {
			buffer = ev.buf,
			desc = "[Conform] Format Code",
		})
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
