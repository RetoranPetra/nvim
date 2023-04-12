-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Destroy the horrible yoink highlighting.
vim.api.nvim_clear_autocmds({ group = "lazyvim_highlight_yank" })
