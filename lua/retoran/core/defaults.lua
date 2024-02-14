local opt = vim.opt
-- Disable netrw so neotree can be used

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.termguicolors = true
