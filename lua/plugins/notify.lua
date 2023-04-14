return {
  "rcarriga/nvim-notify",

  opts = function(_, opts)
    opts = vim.tbl_extend("force", opts, {
      --background_colour = "#000000",
      background_colour = '#2c3043',
      render = "minimal",
      fps = 60,
      top_down = true,
    })
    return opts
  end,
}
