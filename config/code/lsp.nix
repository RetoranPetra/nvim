{
  plugins.lspconfig = {
    enable = true;
  };
  lsp = {
    servers = {
      lua_ls.enable = true;
      nixd.enable = true;
    };
  };
}
