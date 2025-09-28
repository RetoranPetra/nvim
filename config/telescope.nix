{
  plugins.telescope = {
    enable = true;
    keymaps = {
      "<leader>ff" = {
        action = "find_files";
        options.desc = "Find Files";
      };
      "<leader>fg" = {
        action = "live_grep";
        options.desc = "Find Grep";
      };
      "<leader>fb" = {
        action = "buffers";
        options.desc = "Find Buffer";
      };
      "<leader>fh" = {
        action = "help_tags";
        options.desc = "Find Help";
      };
    };
  };
}
