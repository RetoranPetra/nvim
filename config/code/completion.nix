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
    };

    # Old packages, not yet converted to blink-cmp.
#    cmp-nvim-lsp.enable = true;
#    cmp-path.enable = true;
#    cmp-buffer.enable = true;
#    cmp-cmdline.enable = true;
#    cmp-spell.enable = true;
  };
}
