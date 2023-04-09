vim.cmd[[packadd packer.nvim]]

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
			tag = "v<CurrentMajor>.*",
			run = "make install_jsregexp"
		}}
	}
	-- Syntax Highlighting
	use {
        	'nvim-treesitter/nvim-treesitter',
        	run = ':TSUpdate',
			config = function() require('myTreesitter') end
    	}

end)
