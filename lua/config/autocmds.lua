-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Destroy the horrible yoink highlighting.
vim.api.nvim_clear_autocmds({ group = "lazyvim_highlight_yank" })

-- Override nightfly highlights.
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "nightfly",
  callback = function()
  if vim.g.usingGUI == nil then
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE", fg = "#c3ccdc" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "NONE", fg = "#c3ccdc" })
  end
  end,
  group = custom_highlight,
})
