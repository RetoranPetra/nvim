local preferences = {}
function preferences.setup()
	-- Add number lines
	vim.opt.number = true
	-- Set tab size
	vim.opt.tabstop=4
	vim.opt.shiftwidth=4
	--vim.opt.termguicolors = true
	--vim.cmd[[colorscheme nightfly]]
	-- Change nightfly settings
	--vim.g.nightflyTransparent = true
	--vim.g.nightflyCursorColor = true
	--vim.g.nightflyItalics = true
end
return preferences
