{
  # Need to disable netrw for neo-tree
  globals = {
    loaded_netrw = 1;
    loaded_netrwPlugin = 1;
  };

  plugins.neo-tree = {
    enable = true;
    settings = {
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
  keymaps = [
    {
      mode = "n";
      key = "<leader>z";
      action = "[[:Neotree buffers position=float<CR>]]";
      options = {
        silent = true;
        desc = "Neotree Buffers";
      };
    }
    {
      mode = "n";
      key = "<leader>x";
      action = "[[:Neotree toggle position=float<CR>]]";
      options = {
        silent = true;
        desc = "Neotree";
      };
    }
  ];
}
