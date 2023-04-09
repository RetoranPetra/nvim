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

-- Reload configurations if we modify plugins.lua
-- Hint
--     <afile> - replaced with the filename of the buffer being manipulated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Colour scheme
	use {'bluz71/vim-nightfly-colors', as = 'nightfly',
		config = function()
			vim.g.nightflyTransparent = true
			vim.g.nightflyCursorColor = true
			vim.g.nightflyItalics = true
			vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "NONE"})
			vim.cmd[[colorscheme nightfly]]
		end
	}


	-- Other UI
	vim.g.neo_tree_remove_legacy_commands = true
	use {'nvim-neo-tree/neo-tree.nvim', after = 'nightfly',
		requires = {
		'nvim-lua/plenary.nvim',
		'nvim-tree/nvim-web-devicons',
		'MunifTanjim/nui.nvim'
		}
	}

	-- Completion
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/nvim-cmp'}
	use {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp', requires = {'nvim-lspconfig'}}
	use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
	use {'hrsh7th/cmp-path', after = 'nvim-cmp'}
	use {'hrsh7th/cmp-cmdline', after = 'nvim-cmp'}
	use {'L3MON4D3/LuaSnip', run = "make install_jsregexp"}
	use {'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp', requires = {'L3MON4D3/LuaSnip'}}
	-- Syntax Highlighting
	use
	{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
		config = function() require('myTreesitter').setup() end
    }
	use {'norcalli/nvim-colorizer.lua',
		config = function () require("colorizer").setup() end
	}

	-- Git stuff
	use {'tpope/vim-fugitive'}
	use {'lewis6991/gitsigns.nvim',
		config = function()
			require("gitsigns").setup()
		end
	}
	-- Build management
	use {'shatur/neovim-tasks',
		requires = {'nvim-lua/plenary.nvim','mfussenegger/nvim-dap'}
	}



	if packer_bootstrap then
		require("packer").sync()
	end
end)
