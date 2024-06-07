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
