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
        snippets = { preset = "luasnip";};
        sources = {
          default = [
            "snippets"
            "lsp"
            "path"
            "buffer"
          ];
          providers = {
            snippets = {
              score_offset = 4;
            };
            lsp = {
              score_offset = 3;
            };
            path = {
              score_offset = 2;
            };
            buffer = {
              score_offset = 2;
            };
          };
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
