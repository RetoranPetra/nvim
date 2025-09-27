-- Defaults

local opt = vim.opt
opt.timeoutlen = 1500
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true
opt.swapfile = false
-- Polyglot wants this
opt.compatible = false

-- Filetype overrides
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype for xml-like files without types to xml.",
	pattern = {
		"*.xaml",
		"*.axaml",
	},
	command = "set filetype=xml",
})
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	desc = "Set filetype for nuget cache (Pointless but neat)",
	pattern = { "*.nuget.cache" },
	command = "set filetype=json",
})

-- Options
vim.g.mapleader = " "

-- Display
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.conceallevel = 3
vim.opt.showmatch = true
vim.opt.list = true
vim.opt.scrolloff = 4

-- Line number
vim.opt.number = true
vim.opt.relativenumber = true
-- Tabs and indenting
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = true
-- Spelling
vim.opt.spelllang = { "en_gb" }

-- What happens when splitting
vim.opt.splitright = true

-- Ignore case when searching
vim.opt.smartcase = true
-- Input
vim.opt.mouse = "a"
vim.opt.ttyfast = true
-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

-- plugins

--require"nvim-web-devicons".setup{}
--require"plenary.nvim".setup{}
--require"nui.nvim".setup{}
--require"bufferline.nvim".setup{}
require("nvim-treesitter.configs").setup({
	indent = {
		enable = true,
	},
	highlight = {
		enable = true,
	},
	auto_install = false,
})
