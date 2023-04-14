return {
  "rcarriga/nvim-notify",

  opts = function(_, opts)
    opts = vim.tbl_extend("force", opts, {
      background_colour = "#000000",
      render = "minimal",
      fps = 60,
      top_down = false,
    })
    return opts
  end,
}
