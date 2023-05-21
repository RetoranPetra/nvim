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

-- User overrides for autocmds, need this func for it.
--[[
local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- User override for this, want to add support for fugitive windows.
vim.api.nvim_clear_autocmds({group = "close_with_q"})
-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("close_with_q"),
  pattern = {
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "checkhealth",
    "fugitive",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
--]]
