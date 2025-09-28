{
  plugins = {
    luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp = {
      enable = true;
      settings = {
        sources = [
          [
            { name = "nvim_lsp"; }
          ]
          [
            { name = "buffer"; }
            { name = "path"; }
          ]
        ];
      };
    };
  };
}
