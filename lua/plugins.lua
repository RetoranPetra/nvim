vim.cmd[[packadd packer.nvim]]

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Colour scheme
	use {'bluz71/vim-nightfly-colors', as = 'nightfly',
		config = function()
			vim.opt.termguicolors = true
			vim.g.nightflyTransparent = true
			vim.g.nightflyCursorColor = true
			vim.g.nightflyItalics = true
			vim.cmd[[highlight normal ctermbg=none]]
			vim.cmd[[colorscheme nightfly]]
		end
	}	

	-- Completion
	use {'hrsh7th/nvim-cmp',
		requires = {{'neovim/nvim-lspconfig'},{'hrsh7th/cmp-nvim-lsp'},
		{'hrsh7th/cmp-buffer'},{'hrsh7th/cmp-path'},
		{'hrsh7th/cmp-cmdline'},
		-- Snippet
		{"L3MON4D3/LuaSnip",
			-- Get major release
			--tag = "v<CurrentMajor>.*",
			run = "make install_jsregexp",
			requires = {"saadparwaiz1/cmp_luasnip"}
			--,config = function() require("myCmp").setup() end
		},
		}
	}
	-- Syntax Highlighting
	use
	{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		config = function() require('myTreesitter') end
    }
	if packer_bootstrap then
		require("packer").sync()
	end
end)
