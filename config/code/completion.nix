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
    cmp-cmdline.enable = true;
    cmp-spell.enable = true;
    cmp = {
      enable = true;
      settings = {
        sources = [
            { name = "luasnip"; group_index = 1; }
            { name = "nvim_lsp"; group_index = 1; }
            { name = "buffer"; group_index = 2; }
            { name = "path"; group_index = 2; }
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
        mapping = {
          "<Tab>" =
          ''
            require'cmp'.mapping(function(fallback)
              local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                  and vim.api.nvim_buf_get_lines(0, line -1, line, true)[1]:sub(col, col):match("%s") == nil
              end
              local cmp = require'cmp'
              local luasnip = require'luasnip'
              if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
              elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
              elseif has_words_before() then
                cmp.complete()
              else
                fallback()
              end
            end, {"i","s"})
          '';
          "<S-Tab>" =
            ''
              require'cmp'.mapping(function(fallback)
                local cmp = require'cmp'
                if cmp.visible() then
                  cmp.select_prev_item()
                elseif luasnip.jumpable(-1) then
                  luasnip.jump(-1)
                else
                  fallback()
                end
              end, { "i", "s", "c" })
            '';
          "<CR>" = ''
            cmp.mapping({
            i = function(fallback)
              local cmp = require'cmp'
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = require'cmp'.mapping.confirm({ select = true }),
            c = function(fallback)
              local cmp = require'cmp'
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            })
          '';
        };
      };
    };
  };
  extraConfigLuaPost =
    ''
      local cmp = require'cmp'
      -- Setup commandline
      cmp.setup.cmdline(":", {
        sources = {
          { name = "cmdline" },
        }
      })
      -- Setup for text formats
      cmp.setup.filetype({"markdown", "txt"}, {
        sources = {
          { name = "nvim_lsp" },
          { name = "spell" },
          { name = "path" },
        },
      })
      -- TODO: add auto pairs for completion.
    '';
}
