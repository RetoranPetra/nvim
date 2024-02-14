local opt = vim.opt
vim.g.mapleader = " "

-- Display
opt.wrap = true
opt.linebreak = true
opt.breakindent = true
opt.conceallevel = 3
opt.showmatch = true
-- Line number
opt.number = true
opt.relativenumber = true
-- Tabs and indenting
opt.tabstop = 2
opt.smartindent = true
opt.shiftwidth = 2

-- Ignore case when searching
opt.smartcase = true
-- Input
opt.mouse = "a"
opt.ttyfast = true
