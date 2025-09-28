local toggleterm = require("toggleterm")
local terminal = require("toggleterm.terminal").Terminal

local floatTerm = terminal:new({
	hidden = true,
	direction = "float",
	on_open = function(term)
		if term.is_float(term) then
			vim.cmd("startinsert!")
		end
		vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {
			silent = true,
		})
	end,
})

function _FloatTerm_toggle()
	floatTerm:toggle()
end

local lazygit = terminal:new({
	cmd = "lazygit",
	dir = "git_dir",
	hidden = true,
	direction = "float",
	on_open = function(term)
		vim.cmd("startinsert!")
		-- overrides terminal rebind of escape for this lazygit terminal specifically.
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<esc>", "<esc>", {
			noremap = true,
			silent = true,
		})
		-- NOTE: used for exiting lazygit without closing it completely.
		vim.api.nvim_buf_set_keymap(term.bufnr, "t", "<C-q>", "<cmd>close<CR>", {
			noremap = true,
			silent = true,
		})
	end,
})

function _Lazygit_toggle()
	lazygit:toggle()
end

