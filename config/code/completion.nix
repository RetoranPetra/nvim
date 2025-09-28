{
  plugins = {
    /*
    lspkind = {
      enable = true;
      settings.mode = "symbol";
    };
    */
    luasnip.enable = true;

    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        completion = {
          list = {
            selection = {
              preselect = false;
              auto_insert = false;
            };
          };
          accept.auto_brackets.enabled = true;
        };
        keymap = {
          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
          "<CR>" = [
            "select_and_accept"
            "fallback"
          ];
        };
      };
    };

    # Old packages, not yet converted to blink-cmp.
#    cmp-nvim-lsp.enable = true;
#    cmp-path.enable = true;
#    cmp-buffer.enable = true;
#    cmp-cmdline.enable = true;
#    cmp-spell.enable = true;
  };
}
