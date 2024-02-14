return {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  config = function()
    if vim.g.usingGUI == nil then
      vim.g.nightflyTransparent = true
    end
    vim.g.nightflyCursorColor = true
    vim.g.nightflyItalics = true
    vim.cmd([[colorscheme nightfly]])
  end,
}
