vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Colour scheme
	use {'bluz71/vim-nightfly-colors', as = 'nightfly',}	

	use {'hrsh7th/nvim-cmp',
		requires = {{'neovim/nvim-lspconfig'},{'hrsh7th/cmp-nvim-lsp'},{'hrsh7th/cmp-buffer'},{'hrsh7th/cmp-path'},{'hrsh7th/cmp-cmdline'},},
	}
	-- Syntax Highlighting
	use {
        	'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate',
			config = function() require('myTreesitter') end,
    	}

end)
