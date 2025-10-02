{
  plugins = {
    luasnip.enable = true;
    blink-cmp-spell.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
      settings = {
        completion = {
          list = {
            selection = {
              preselect = false;
              auto_insert = true;
            };
          };
          accept.auto_brackets.enabled = true;
        };
        sources = {
          default = [
            "lsp"
            "path"
            "buffer"
          ];
          per_filetype = {
            markdown = [
              "lsp"
              "path"
              "spell"
            ];
            txt = [
              "spell"
              "buffer"
            ];
          };
        };
        #fuzzy.use_typo_resistance = false;
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
  };
}
