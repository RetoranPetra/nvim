vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
	desc = "Set filetype for xml-like files without types to xml.",
	pattern = {"*.xaml"},
	command = "set filetype=xml"
})
vim.api.nvim_create_autocmd({"BufRead","BufNewFile"}, {
	desc = "Set filetype for nuget cache (Pointless but neat)",
	pattern = {"*.nuget.cache"},
	command = "set filetype=json"
})
