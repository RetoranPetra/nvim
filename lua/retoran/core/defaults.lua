local opt = vim.opt
opt.timeoutlen = 1500
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true
opt.swapfile = false
-- Polyglot wants this
opt.compatible = false
-- Set OS global variable for reference.
vim.g.os = vim.loop.os_uname().sysname
