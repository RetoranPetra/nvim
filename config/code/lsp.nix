{
  plugins.lspconfig = {
    enable = true;
  };
  lsp = {
    servers = {
      lua_ls.enable = true;
      nixd.enable = true;
      bashls.enable = true;
      clangd.enable = true;
      omnisharp.enable = true;
      rust_analyzer.enable = true;
      gopls.enable = true;
      pylsp.enable = true;
      lemminx.enable = true;
    };
    keymaps = [
      # TODO: Can maybe replace "gd" with telescope gd.
      #       see https://github.com/nix-community/nixvim/blob/main/modules/lsp/keymaps.nix
      { mode = "n"; key = "gd"; lspBufAction = "definition"; }
      { mode = "n"; key = "gD"; lspBufAction = "declaration"; }
      { mode = "n"; key = "K"; lspBufAction = "hover"; }
      { mode = "n"; key = "gi"; lspBufAction = "implementation"; }
      { mode = "n"; key = "<C-k>"; lspBufAction = "signature_help"; }
      # Omitting workspace folder stuff, never used it.
      { mode = "n"; key = "<leader>T"; lspBufAction = "type_definition"; }
      { mode = "n"; key = "<leader>r"; lspBufAction = "rename"; }
      { mode = "n"; key = "<leader>."; lspBufAction = "code_action"; }
      { mode = "n"; key = "gr"; lspBufAction = "references"; }
      # Add format code when we've set up conform.
    ];
  };
}
