{
  plugins = {
    bufferline.enable = true;
    dressing.enable = true;
    lualine = {
      enable = true;
      settings = {
        icons_enabled = true;
        theme = "auto";
      };
    };
    notify = {
      enable = true;
      settings = {
        background_colour = "#000000";
        render = "wrapped-compact";
        stages = "fade";
        timeout = 2000;
      };
    };
    noice = {
      enable = true;
      settings = {
        lsp = {
          override = {
            # Override handling of documentation to noice
            "vim.lsp.util.convert_input_to_markdown_lines" = true;
            "vim.lsp.util.stylize_markdown" = true;
            #"cmp.entry.get_documentation" = true;
          };
        };
        cmdline = {
          enabled = true;
          view = "cmdline";
        };
      };
    };
    web-devicons.enable = true;
  };
}
