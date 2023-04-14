return {
  "bluz71/vim-nightfly-colors",
  name = "nightfly",
  config = function()
    if vim.g.useTransparency then
      vim.g.nightflyTransparent = true
    end
    vim.g.nightflyCursorColor = true
    vim.g.nightflyItalics = true
  end,
}
