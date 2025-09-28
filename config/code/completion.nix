{
  plugins = {
    lspkind = {
      enable = true;
      settings.mode = "symbol";
    };
    luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    cmp = {
      enable = true;
      settings = {
        sources = [
            { name = "luasnip"; }
            { name = "nvim_lsp"; }
            { name = "buffer"; }
            { name = "path"; }
        ];
        preselect = "require'cmp'.PreselectMode.None";
        # NOTE: formatting.format is set in lspkind config, we don't need it here.
        completion.completeopt = "menu,menuone,noinsert,noselect";
        snippet = {
          expand =
            ''
            function(args)
              require"luasnip".lsp_expand(args.body)
            end
            '';
        };
      };
    };
  };
}
