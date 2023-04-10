local preferences = {}
function preferences.setup()
	vim.opt.completeopt = {'menu','menuone','noselect'}
	-- Stop telling me stuff I know
	vim.opt.showmode = false
	-- Lets vim know it can use all the colors
	vim.opt.termguicolors = true
	-- Forces transparency
	vim.cmd[[highlight normal ctermbg=none]]
	-- Add number lines
	--vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.number = true
	-- Set tab size
	vim.opt.tabstop=4
	vim.opt.shiftwidth=4
	-- Allow mouse
	vim.opt.mouse = 'a'

	-- Alter search
	--vim.opt.hlsearch = false

	-- Clipboard stuff
	vim.opt.clipboard = 'unnamedplus' --use system clipboard
	vim.opt.paste = true
	vim.keymap.set({'n','v'}, '<leader>p', '"+p', {noremap = true})
	vim.keymap.set({'n','v'}, '<leader>P', '"+P', {noremap = true})
	vim.keymap.set({'n','v'}, '<leader>y', '"+y', {noremap = true})
	vim.keymap.set({'n','v'}, '<leader>Y', '"+Y', {noremap = true})
	vim.keymap.set('n','<C-S-c>', '"*y')
	vim.keymap.set('n','<C-S-v>', '"*p')
end
return preferences
