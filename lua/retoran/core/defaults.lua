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
if vim.g.os == "MINGW32_NT-10.0" then
	vim.g.mingw64 = true
	vim.opt.shellcmdflag="-s"
	vim.opt.shellslash=true
elseif vim.g.os == "Windows_NT" and os.getenv("MINGW_CHOST") == "x86_64-w64-mingw32" then
	vim.g.mingw64 = true
	vim.opt.shell = "C:\\Windows\\system32\\cmd.exe"
else
	vim.g.mingw64 = false
end
