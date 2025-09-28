{ nixpkgs, ... }:
{
  plugins.toggleterm = {
    enable = true;
    settings = {
      shade_terminals = false;
      insert_mappings = false;
      terminal_mappings = false;
      on_open = builtins.readFile ./toggleterm-on_open.lua;
      open_mapping = "[[<leader>t]]";
    };
  };
  extraConfigLua = builtins.readFile ./toggleterm-extraConfigLua.lua;
  keymaps = [
    {
      mode = "n";
      key = "<leader>s";
      action = "<cmd>lua _FloatTerm_toggle()<CR>";
      options = {
        silent = true;
        desc = "Toggle FloatTerm";
      };
    }
    {
      mode = "n";
      key = "<leader>g";
      action = "<cmd>lua _Lazygit_toggle()<CR>";
      options = { silent = true; desc = "Lazygit"; };
    }
    {
      mode = "n";
      key = "<leader>ft";
      action = ":TermSelect<CR>";
      options = {
        silent = true;
        desc = "Find ToggleTerms";
      };
    }
  ];
}
