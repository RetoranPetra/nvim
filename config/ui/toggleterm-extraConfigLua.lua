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
