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
if vim.g.os == "Windows_NT" and os.getenv("MINGW_CHOST") == "x86_64-w64-mingw32" then
	vim.g.mingw64 = true
	-- Attempt at making BASH shell work.
	-- Given up, forcing use of regular cmd.
	--vim.opt.shellcmdflag="-c"
	--vim.opt.shellslash=true
	--vim.opt.shell="/usr/bin/bash"
	--vim.opt.shell="/usr/bin/zsh"
	vim.opt.shell = "C:\\Windows\\system32\\cmd.exe"
	--vim.opt.shell="powershell.exe"
else
	vim.g.mingw64 = false
end
