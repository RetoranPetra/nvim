function(term)
	if term.is_float(term) then
		vim.cmd("startinsert!")
	end
	vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {
		silent = true,
	})
end
