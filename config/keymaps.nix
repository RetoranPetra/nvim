{
  keymaps = [
    # better up/down
    {
      mode = ["n" "x"]; key = "j"; action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; silent = true; };
    }
    {
      mode = ["n" "x"]; key = "<down>"; action = "v:count == 0 ? 'gj' : 'j'";
      options = { expr = true; silent = true; };
    }
    {
      mode = ["n" "x"]; key = "k"; action = "v:count == 0 ? 'gk' : 'k'";
      options = { expr = true; silent = true; };
    }
    {
      mode = ["n" "x"]; key = "<up>"; action = "v:count == 0 ? 'gk' : 'k'";
      options = { expr = true; silent = true; };
    }
    # Navigate windows with ctrl + hjkl
    {
      mode = "n"; key = "<C-h>"; action = "<C-W>h";
      options = { desc = "Go to left window"; remap = true; };
    }
    {
      mode = "n"; key = "<C-j>"; action = "<C-W>j";
      options = { desc = "Go to lower window"; remap = true; };
    }
    {
      mode = "n"; key = "<C-k>"; action = "<C-W>k";
      options = { desc = "Go to upper window"; remap = true; };
    }
    {
      mode = "n"; key = "<C-l>"; action = "<C-W>l";
      options = { desc = "Go to right window"; remap = true; };
    }
    # same but allows during terminal
    # TODO: Port this over from the old config.

    # Allow pressing escape to escape termial mode
    {
      mode = "t"; key = "<esc>"; action = "<C-\\><c-n>";
    }
    # Navigate through buffers
    {
      mode = "n"; key = "<S-h>"; action = "<cmd>bprevious<CR>";
      options.desc = "Previous Buffer";
    }
    {
      mode = "n"; key = "<S-l>"; action = "<cmd>bnext<CR>";
      options.desc = "Next Buffer";
    }
    # Clear search results on empty enter
    {
      mode = "n"; key = "<CR>"; action = "<CR>:noh<CR>";
      options = { noremap = true; silent = true; };
    }
    # TODO: Add diagnostics keybinds

    # TODO: Add LSP keybinds either here or elsewhere.
  ];
}
