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
vim.g.mingw64 = true
vim.g.tsAutoInstall = false
if vim.g.mingw64 then
	-- Attempt at making BASH shell work.
	-- Given up, forcing use of regular cmd.
	--vim.opt.shellcmdflag="-c"
	--vim.opt.shellslash=true
	--vim.opt.shell="/usr/bin/bash"
	vim.opt.shell="cmd.exe"
end
