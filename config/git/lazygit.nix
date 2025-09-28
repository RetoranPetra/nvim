{
  keymaps = [
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>LazyGit<cr>";
      options.desc = "LazyGit";
    }
  ];

  plugins.lazygit = {
    enable = true;
  };
}
