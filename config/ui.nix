{
  # Need to disable netrw for neo-tree
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  plugins = {
    bufferline.enable = true;
    dressing.enable = true;
    neo-tree = {
      enable = true;
      extraOptions = {
        hide_root_node = true;
        filesystem = {
          cwd_target.current = "global";
          follow_current_file = {
            enabled = true;
            leave_dirs_open = false;
          };
          hijack_netrw_behaviour = "open_default";
          use_libuv_file_watcher = true;
        };
        buffers = {
          follow_current_file = {
            enable = true;
            leave_dirs_open = false;
          };
        };
        window = {
          position = "current";
        };
      };
    };
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
  };
}
