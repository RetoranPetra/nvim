local preferences = {}
function preferences.setup()
	-- Lets vim know it can use all the colors
	vim.opt.termguicolors = true
	-- Forces transparency
	vim.cmd[[highlight normal ctermbg=none]]
	-- Add number lines
	vim.opt.number = true
	-- Set tab size
	vim.opt.tabstop=4
	vim.opt.shiftwidth=4

	vim.opt.clipboard = vim.opt.clipboard + "unnamed"
	vim.opt.paste = true

	vim.keymap.set({'n','v'}, '<leader>p', '"+p')
	vim.keymap.set({'n','v'}, '<leader>P', '"+P')
	vim.keymap.set({'n','v'}, '<leader>y', '"+y')
	vim.keymap.set({'n','v'}, '<leader>Y', '"+Y')
	vim.keymap.set('n','<C-S-c>', '"*y')
	vim.keymap.set('n','<C-S-v>', '"*p')
end
return preferences
