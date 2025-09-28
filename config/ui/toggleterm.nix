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
  extraConfigLua = ''
    local toggleterm = require("toggleterm")
    local terminal = require("toggleterm.terminal").Terminal

    local floatTerm = terminal:new({
      hidden = true,
      direction = "float",
      on_open = function(term)
        if term.is_float(term) then
          vim.cmd("startinsert!")
        end
        vim.api.nvim_buf_set_keymap(term.bufnr, "n", "<esc>", "<cmd>close<CR>", {
          silent = true,
        })
      end,
    })

    function _FloatTerm_toggle()
      floatTerm:toggle()
    end
  '';
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
      key = "<leader>ft";
      action = ":TermSelect<CR>";
      options = {
        silent = true;
        desc = "Find ToggleTerms";
      };
    }
  ];
}
